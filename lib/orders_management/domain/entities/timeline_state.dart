import 'package:orders_explorer/orders_management/data/models/order.dart';

class TimelineState {
  DateTime startDate;
  DateTime endDate;
  Map<DateTime?, List<Order>> allDailyOrders;
  Map<DateTime?, List<Order>> filteredDailyOrders;

  TimelineState({
    required this.startDate,
    required this.endDate,
    Map<DateTime?, List<Order>>? allDailyOrders,
    Map<DateTime?, List<Order>>? filteredDailyOrders,
  })  : allDailyOrders = allDailyOrders ?? {},
        filteredDailyOrders = filteredDailyOrders ?? {};

  TimelineState copyWith({
    DateTime? startDate,
    DateTime? endDate,
    Map<DateTime?, List<Order>>? allDailyOrders,
    Map<DateTime?, List<Order>>? filteredDailyOrders,
  }) =>
      TimelineState(
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        allDailyOrders: allDailyOrders ?? this.allDailyOrders,
        filteredDailyOrders: filteredDailyOrders ?? this.filteredDailyOrders,
      );
}
