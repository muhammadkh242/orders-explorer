import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orders_explorer/app_routes_config.dart';
import 'package:orders_explorer/base/di/base_injection.dart';
import 'package:orders_explorer/base/domain/entities/theme_mode.dart';
import 'package:orders_explorer/common/theme/app_color_scheme.dart';
import 'package:orders_explorer/common/theme/app_theme.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, __) {
        final themeMode = ref.watch(themeProvider);
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          builder: (context, child) => ResponsiveBreakpoints.builder(
            breakpoints: [
              const Breakpoint(start: 0, end: 640, name: MOBILE),
              const Breakpoint(start: 641, end: 1024, name: TABLET),
              const Breakpoint(start: 1025, end: 1440, name: DESKTOP),
              const Breakpoint(start: 1441, end: 2560, name: '4K'),
            ],
            child: child!,
          ),
          themeMode: switch (themeMode) {
            AppThemeMode.light => ThemeMode.light,
            AppThemeMode.dark => ThemeMode.dark,
            AppThemeMode.system => ThemeMode.system,
          },
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: AppTheme.light.colorScheme,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: AppTheme.dark.colorScheme,
          ),
        );
      },
    );
  }
}
