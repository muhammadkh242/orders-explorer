import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/theme_mode.dart';
import '../helpers/theme_controller.dart';

final themeProvider = StateNotifierProvider<ThemeController, AppThemeMode>((ref) {
  return ThemeController();
});
