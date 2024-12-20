import 'package:flutter/material.dart';
import 'package:orders_explorer/orders_management/presentation/screens/dashboard_screen.dart';
import 'package:orders_explorer/orders_management/presentation/screens/timeline_screen.dart';

enum MainTab {
  dashboard,
  timeline;

  String get label {
    switch (this) {
      case MainTab.dashboard:
        return "Dashboard";
      case MainTab.timeline:
        return "Timeline";
    }
  }

  IconData get icon {
    switch (this) {
      case MainTab.dashboard:
        return Icons.dashboard;
      case MainTab.timeline:
        return Icons.timeline;
    }
  }

  String get route {
    switch (this) {
      case MainTab.dashboard:
        return DashboardScreen.routeName;
      case MainTab.timeline:
        return TimelineScreen.routeName;
    }
  }
}
