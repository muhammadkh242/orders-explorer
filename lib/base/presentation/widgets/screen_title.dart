import 'package:flutter/material.dart';
import 'package:orders_explorer/base/helpers/responsive_helper.dart';
import 'package:orders_explorer/base/presentation/widgets/theme_toggle_icon.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        if (context.isMobile) const ThemeToggleIcon(),
      ],
    );
  }
}
