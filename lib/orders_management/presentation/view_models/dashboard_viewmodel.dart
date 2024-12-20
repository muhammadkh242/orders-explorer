import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orders_explorer/base/domain/entities/base_state.dart';
import 'package:orders_explorer/orders_management/domain/entities/dashboard_state.dart';
import 'package:orders_explorer/orders_management/domain/usecases/get_orders.dart';

class DashboardViewModel extends StateNotifier<BaseState<DashBoardState>> {
  DashboardViewModel(this._getOrders)
      : super(
          BaseState(data: DashBoardState()),
        );

  final GetOrders _getOrders;

  getOrders() async {
    final result = await _getOrders();
    debugPrint("DashboardViewModel : ${result.data?.first.company}");
  }
}
