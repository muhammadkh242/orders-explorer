import 'package:flutter/material.dart';

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
    return TabBar(
      onTap: onTap,
      controller: controller,
      tabs: MainTab.values
          .map(
            (tab) => Tab(
              icon: Icon(tab.icon),
              text: tab.label,
            ),
          )
          .toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
