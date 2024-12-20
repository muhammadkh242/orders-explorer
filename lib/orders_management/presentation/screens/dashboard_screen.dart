import 'package:flutter/material.dart';
import 'package:orders_explorer/base/helpers/context_extension.dart';
import 'package:orders_explorer/orders_management/utils/di/orders_injection.dart'
    as di;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const String routeName = "/dashboard";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    context.read(di.dashboardViewModelProvider.notifier).getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("DashboardScreen")),
    );
  }
}
