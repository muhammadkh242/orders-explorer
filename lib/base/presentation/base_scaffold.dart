import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orders_explorer/base/domain/entities/main_tab.dart';
import 'package:orders_explorer/base/helpers/responsive_helper.dart';
import 'package:orders_explorer/base/presentation/widgets/app_header.dart';

class BaseScaffold extends StatefulWidget {
  const BaseScaffold({super.key, required this.child});

  final Widget child;

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(
      length: MainTab.values.length,
      vsync: this,
      initialIndex: MainTab.dashboard.index,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isMobile
          ? null
          : AppHeader(
        controller: controller,
        onTap: onDestinationChange,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.horizontalPadding,
            vertical: context.verticalPadding,
          ),
          child: widget.child,
        ),
      ),
      bottomNavigationBar: context.isMobile
          ? NavigationBar(
        height: 65,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: MainTab.values
            .map(
              (tab) => NavigationDestination(
            icon: Icon(tab.icon, size: 24),
            label: tab.label,
          ),
        )
            .toList(),
        onDestinationSelected: onDestinationChange,
        selectedIndex: controller.index,
      )
          : null,
    );
  }

  void onDestinationChange(int? index) {
    controller.animateTo(index ?? 0);
    context.go(
      MainTab.values
          .firstWhere((element) => element.index == (index ?? 0))
          .route,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}