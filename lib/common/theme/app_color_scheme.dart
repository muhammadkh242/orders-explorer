import 'package:flutter/material.dart';

import 'app_theme.dart';

extension AppColorScheme on AppTheme {
  ColorScheme get colorScheme {
    switch (this) {
      case AppTheme.light:
        return _lightColorScheme;
      case AppTheme.dark:
        return _darkColorScheme;
    }
  }

  ColorScheme get _lightColorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF635BFF),
        // Our main purple
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFFECEBFF),
        onPrimaryContainer: Color(0xFF100F33),
        secondary: Color(0xFF556CD6),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFE3E8FF),
        onSecondaryContainer: Color(0xFF0A1033),
        tertiary: Color(0xFF8B5CF6),
        onTertiary: Color(0xFFFFFFFF),
        tertiaryContainer: Color(0xFFF3EEFF),
        onTertiaryContainer: Color(0xFF1A0B3F),
        error: Color(0xFFDC2626),
        onError: Color(0xFFFFFFFF),
        errorContainer: Color(0xFFFEE2E2),
        onErrorContainer: Color(0xFF410002),
        outline: Color(0xFF79758F),
        background: Color(0xFFFFFFFF),
        onBackground: Color(0xFF1A1F36),
        surface: Color(0xFFF7FAFC),
        onSurface: Color(0xFF1A1F36),
        surfaceVariant: Color(0xFFF1F1F4),
        onSurfaceVariant: Color(0xFF696E77),
        inverseSurface: Color(0xFF313131),
        onInverseSurface: Color(0xFFF5F5F5),
        inversePrimary: Color(0xFFB0ABFF),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFF635BFF),
        outlineVariant: Color(0xFFE4E4E7),
        scrim: Color(0xFF000000),
      );

  ColorScheme get _darkColorScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFFB0ABFF),
        // Lighter purple for dark theme
        onPrimary: Color(0xFF1A1633),
        primaryContainer: Color(0xFF4640B3),
        onPrimaryContainer: Color(0xFFE6E4FF),
        secondary: Color(0xFFADB9EE),
        onSecondary: Color(0xFF1A2145),
        secondaryContainer: Color(0xFF3B4B94),
        onSecondaryContainer: Color(0xFFE3E8FF),
        tertiary: Color(0xFFC4B5F8),
        onTertiary: Color(0xFF2D1B66),
        tertiaryContainer: Color(0xFF6440CD),
        onTertiaryContainer: Color(0xFFF3EEFF),
        error: Color(0xFFFCA5A5),
        onError: Color(0xFF4C1818),
        errorContainer: Color(0xFF931F1F),
        onErrorContainer: Color(0xFFFFDAD6),
        outline: Color(0xFF938F99),
        background: Color(0xFF1A1F36),
        onBackground: Color(0xFFE5E7EB),
        surface: Color(0xFF1F2937),
        onSurface: Color(0xFFE5E7EB),
        surfaceVariant: Color(0xFF2D3548),
        onSurfaceVariant: Color(0xFFBEC1C8),
        inverseSurface: Color(0xFFF5F5F5),
        onInverseSurface: Color(0xFF1F2937),
        inversePrimary: Color(0xFF635BFF),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFFB0ABFF),
        outlineVariant: Color(0xFF3D4154),
        scrim: Color(0xFF000000),
      );
}
