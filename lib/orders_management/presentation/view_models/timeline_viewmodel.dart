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
              startDate: DateTime(2021, 10, 31),
              endDate: DateTime(2021, 10, 31).subtract(const Duration(days: 6)),
            ),
          ),
        );
  final GetOrders _getOrders;

  getOrders() async {
    _switchLoading(true);
    final result = await _getOrders();
    if (result.data != null) {
      _initDailyOrdersMaps(result.data ?? []);
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

  _initDailyOrdersMaps(List<Order> orderList) {
    Map<DateTime?, List<Order>> groupedOrders = orderList.groupListsBy(
      (element) => element.registered,
    );
    final filteredDailyOrders = _getFilteredDailyOrders(groupedOrders);
    state = state.copyWith(
      data: state.data.copyWith(
        allDailyOrders: groupedOrders,
        filteredDailyOrders: filteredDailyOrders,
      ),
    );
  }

  Map<DateTime?, List<Order>> _getFilteredDailyOrders(
      Map<DateTime?, List<Order>> groupedOrders) {
    Map<DateTime?, List<Order>> filteredGroupedOrders = Map.fromEntries(
      groupedOrders.entries.where(
        (entry) =>
            entry.key != null &&
            entry.key!.isAfter(
                state.data.startDate.subtract(const Duration(days: 1))) &&
            entry.key!
                .isBefore(state.data.endDate.add(const Duration(days: 1))),
      ),
    );
    return filteredGroupedOrders;
  }
}
