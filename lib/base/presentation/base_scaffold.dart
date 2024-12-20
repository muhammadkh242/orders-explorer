import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orders_explorer/base/domain/entities/main_tab.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BaseScaffold extends StatefulWidget {
  const BaseScaffold({super.key, required this.child});

  final Widget child;

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(
        length: MainTab.values.length,
        vsync: this,
        initialIndex: MainTab.dashboard.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final showBottomBar =
        !kIsWeb && ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    if (showBottomBar) {
      return Scaffold(
        body: widget.child,
        bottomNavigationBar: NavigationBar(
          destinations: MainTab.values
              .map(
                (tab) => NavigationDestination(
                    icon: Icon(tab.icon), label: tab.label),
              )
              .toList(),
          onDestinationSelected: onDestinationChange,
          selectedIndex: controller.index,
        ),
      );
    } else {
      return Scaffold(
        appBar: TabBar(
          onTap: onDestinationChange,
            controller: controller,
            tabs: MainTab.values
                .map(
                  (tab) => Tab(
                    icon: Icon(tab.icon),
                    text: tab.label,
                  ),
                )
                .toList()),
        body: widget.child,
      );
    }
  }

  onDestinationChange(int? index) {
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
