import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:orders_explorer/base/presentation/base_scaffold.dart';
import 'package:orders_explorer/orders_management/presentation/screens/dashboard_screen.dart';
import 'package:orders_explorer/orders_management/presentation/screens/timeline_screen.dart';
import 'package:orders_explorer/orders_management/presentation/view_models/dashboard_viewmodel.dart';
import 'package:orders_explorer/orders_management/utils/di/orders_injection.dart'
    as di;

final router = GoRouter(
  initialLocation: DashboardScreen.routeName,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return BaseScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: DashboardScreen.routeName,
          pageBuilder: (context, state) => NoTransitionPage(
            child: ProviderScope(
              overrides: [
                di.dashboardViewModelProvider.overrideWith((ref) =>
                    DashboardViewModel(ref.watch(di.getOrdersProvider))),
              ],
              child: const DashboardScreen(),
            ),
          ),
        ),
        GoRoute(
          path: TimelineScreen.routeName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: TimelineScreen(),
          ),
        ),
      ],
    ),
  ],
);
