import 'package:go_router/go_router.dart';
import 'package:orders_explorer/base/presentation/base_scaffold.dart';
import 'package:orders_explorer/orders_management/presentation/screens/dashboard_screen.dart';
import 'package:orders_explorer/orders_management/presentation/screens/timeline_screen.dart';

final router = GoRouter(
  initialLocation: DashboardScreen.routeName,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BaseScaffold(child: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: DashboardScreen.routeName,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: DashboardScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: TimelineScreen.routeName,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: TimelineScreen(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
