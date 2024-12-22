import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orders_explorer/base/helpers/context_extension.dart';
import 'package:orders_explorer/base/helpers/responsive_helper.dart';

import '../../di/base_injection.dart';
import '../../domain/entities/theme_mode.dart';

class ThemeToggleIcon extends StatelessWidget {
  const ThemeToggleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Consumer(
        builder: (_, ref, __) {
          final isPlatformLight =
              MediaQuery.platformBrightnessOf(context) == Brightness.light;
          final appThemeMode = ref.watch(themeProvider);
          return Icon(
            size: context.isMinimized ? 35 : 45,
            switch (appThemeMode) {
              AppThemeMode.light => Icons.dark_mode,
              AppThemeMode.dark => Icons.light_mode,
              AppThemeMode.system =>
                isPlatformLight ? Icons.dark_mode : Icons.light_mode,
            },
          );
        },
      ),
      onTap: () {
        context.read(themeProvider.notifier).toggleTheme(context);
      },
    );
  }
}
