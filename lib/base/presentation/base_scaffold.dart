import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orders_explorer/base/domain/entities/main_tab.dart';
import 'package:orders_explorer/base/helpers/screen_utils.dart';
import 'package:orders_explorer/base/helpers/widget_modifier.dart';
import 'package:orders_explorer/base/presentation/widgets/app_header.dart';

class BaseScaffold extends StatefulWidget {
  const BaseScaffold({super.key, required this.child});

  final Widget child;

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold>
    with SingleTickerProviderStateMixin, ScreenUtils {
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
    final showBottomBar = !kIsWeb && isMobile(context);
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
        appBar: AppHeader(
          controller: controller,
          onTap: onDestinationChange,
        ),
        body: widget.child
            .cornerRadius(BorderRadiusDirectional.circular(16))
            .paddingHorizontal(MediaQuery.of(context).size.width * 0.15)
            .paddingVertical(24),
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
