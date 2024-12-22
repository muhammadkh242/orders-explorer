import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/entities/theme_mode.dart';

class ThemeController extends StateNotifier<AppThemeMode> {
  ThemeController() : super(AppThemeMode.system);

  void toggleTheme(BuildContext context) {
    if (state == AppThemeMode.system) {
      final isPlatformDark =
          MediaQuery.platformBrightnessOf(context) == Brightness.dark;
      state = isPlatformDark ? AppThemeMode.light : AppThemeMode.dark;
    } else {
      state =
          state == AppThemeMode.light ? AppThemeMode.dark : AppThemeMode.light;
    }
  }
}
