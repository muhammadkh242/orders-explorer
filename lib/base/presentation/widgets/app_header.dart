import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orders_explorer/base/helpers/widget_modifier.dart';
import '../../domain/entities/main_tab.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({
    super.key,
    required this.controller,
    this.onTap,
  });

  final TabController controller;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                context.go(MainTab.dashboard.route);
                controller.animateTo(MainTab.dashboard.index);
              },
              child: SizedBox(
                width: 160,
                height: 60,
                child:
                    Image.asset("assets/images/logo.png").paddingVertical(8),
              ),
            ).paddingHorizontal(16),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: TabBar(
                onTap: onTap,
                controller: controller,
                padding: EdgeInsets.zero,
                indicator: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2,
                      color: Colors.blue,
                    ),
                  ),
                ),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                labelStyle: const TextStyle(fontSize: 18),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: MainTab.values
                    .map(
                      (tab) => Tab(
                        text: tab.label,
                        height: 60,
                      ),
                    )
                    .toList(),
              ),
            ),
            const Spacer(),
            const SizedBox(
              width: 160,
              height: 60,
            ).paddingHorizontal(16),
          ],
        ),
        const Divider(height: 1),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
