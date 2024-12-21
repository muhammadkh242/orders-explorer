import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orders_explorer/base/domain/entities/base_state.dart';
import 'package:orders_explorer/orders_management/domain/entities/timeline_state.dart';
import 'package:orders_explorer/orders_management/domain/usecases/get_orders.dart';
import "package:collection/collection.dart";
import '../../data/models/order.dart';

class TimelineViewModel extends StateNotifier<BaseState<TimelineState>> {
  TimelineViewModel(this._getOrders)
      : super(
          BaseState(
            data: TimelineState(
              startDate:
                  DateTime(2021, 10, 31).subtract(const Duration(days: 6)),
              endDate: DateTime(2021, 10, 31),
            ),
          ),
        );
  final GetOrders _getOrders;

  getOrders() async {
    _switchLoading(true);
    final result = await _getOrders();
    if (result.data != null) {
      _initGroupedByDateOrders(result.data ?? []);
      // _initDailyOrdersMaps(result.data ?? []);
    } else {
      state = state.copyWith(error: result.error);
    }

    _switchLoading(false);
  }

  _switchLoading(bool value) {
    state = state.copyWith(
      isLoading: value,
    );
  }

  _initGroupedByDateOrders(List<Order> orderList) {
    Map<DateTime?, List<Order>> groupedOrders = orderList.groupListsBy(
      (element) => element.registered,
    );

    Map<DateTime?, List<Order>> filteredGroupedOrders = Map.fromEntries(
      groupedOrders.entries.where((entry) =>
          isDateInRange(entry.key, state.data.startDate, state.data.endDate)),
    );
    state = state.copyWith(
      data: state.data.copyWith(
        allDailyOrders: groupedOrders,
        filteredDailyOrders: filteredGroupedOrders,
      ),
    );
  }

  bool isDateInRange(DateTime? date, DateTime startDate, DateTime endDate) {
    if (date == null) return false;

    DateTime normalizedDate = DateTime(date.year, date.month, date.day);
    DateTime normalizedStart = DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
    );
    DateTime normalizedEnd = DateTime(
      endDate.year,
      endDate.month,
      endDate.day,
    );

    return !normalizedDate.isBefore(normalizedStart) &&
        !normalizedDate.isAfter(normalizedEnd);
  }

  _filterOrders(DateTime start, DateTime end) {
    Map<DateTime?, List<Order>> groupedOrders = state.data.allDailyOrders;

    Map<DateTime?, List<Order>> filteredGroupedOrders = Map.fromEntries(
      groupedOrders.entries
          .where((entry) => isDateInRange(entry.key, start, end)),
    );
    state = state.copyWith(
      data: state.data.copyWith(
        filteredDailyOrders: filteredGroupedOrders,
      ),
    );
  }

  changeDateRange(DateTime startDate, DateTime endDate) {
    state = state.copyWith(
      data: state.data.copyWith(
        startDate: startDate,
        endDate: endDate,
      ),
    );
    _filterOrders(startDate, endDate);
  }
}
