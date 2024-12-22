import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orders_explorer/app_routes_config.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}