import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orders_explorer/base/domain/entities/base_state.dart';
import 'package:orders_explorer/orders_management/domain/entities/company.dart';
import 'package:orders_explorer/orders_management/domain/entities/dashboard_state.dart';
import 'package:orders_explorer/orders_management/domain/usecases/get_orders.dart';
import '../../data/models/order.dart';
import '../../domain/entities/order_status.dart';

class DashboardViewModel extends StateNotifier<BaseState<DashBoardState>> {
  DashboardViewModel(this._getOrders)
      : super(
          BaseState(data: DashBoardState()),
        );

  final GetOrders _getOrders;

  getOrders() async {
    _switchLoading(true);
    final result = await _getOrders();
    if (result.data != null) {
      _updateState(result.data ?? []);
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

  _updateState(List<Order> ordersList) {
    int totalOrders = ordersList.length;
    double totalPrice = 0;
    for (var order in ordersList) {
      String priceStr = order.price ?? '';
      double price =
          double.parse(priceStr.replaceAll('\$', '').replaceAll(',', ''));
      totalPrice += price;
    }
    final averagePrice = totalPrice / totalOrders;
    final returnsCount = ordersList
        .where((order) => order.status == OrderStatus.returned)
        .length;
    final topCompanies =
        _getTopThreeCompanies(_getTotalOrderPricesByCompany(ordersList));
    state = state.copyWith(
      data: state.data?.copyWith(
        totalOrders: totalOrders,
        totalRevenue: totalPrice,
        returnsCount: returnsCount,
        averagePrice: averagePrice,
        topThreeCompanies: topCompanies,
      ),
    );
  }

  Map<String?, double> _getTotalOrderPricesByCompany(List<Order> ordersList) {
    final Map<String?, double> companyTotals = {};

    for (var order in ordersList) {
      final String? priceString = order.price;
      final double price = double.tryParse(
              priceString!.replaceAll('\$', '').replaceAll(',', '')) ??
          0.0;
      final String? company = order.company;

      if (companyTotals.containsKey(company)) {
        companyTotals[company] = (companyTotals[company]! + price);
      } else {
        companyTotals[company] = price;
      }
    }

    return companyTotals;
  }

  List<Company> _getTopThreeCompanies(Map<String?, double> companyTotals) {
    final colors = [
      const Color(0xFF635BFF),
      const Color(0xFF00D924),
      const Color(0xFF0066FF),
    ];
    final sortedCompanies = companyTotals.entries.toList()
      ..sort((company, total) => total.value.compareTo(company.value));
    final sortedTopCompanies = sortedCompanies.take(3).toList();

    final List<Company> topThreeCompanies =
        sortedTopCompanies.asMap().entries.map((entry) {
      final index = entry.key;
      final mapEntry = entry.value;
      return Company(
        name: mapEntry.key,
        ordersTotalPrice: mapEntry.value,
        color: colors[index],
      );
    }).toList();

    return topThreeCompanies;
  }
}
