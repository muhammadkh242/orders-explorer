import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension ResponsiveContext on BuildContext {
  bool get isMobile => ResponsiveBreakpoints.of(this).isMobile;

  bool get isTablet => ResponsiveBreakpoints.of(this).isTablet;

  bool get isDesktop => ResponsiveBreakpoints.of(this).isDesktop;

  bool get isMinimized => MediaQuery.of(this).size.width < 768;

  double get horizontalPadding {
    if (isMobile) return 16;
    if (isTablet) return 24;
    return 32; // desktop
  }

  double get verticalPadding {
    if (isMobile) return 16;
    if (isTablet) return 24;
    return 32; // desktop
  }

  double get maxContentWidth {
    if (isMobile) return double.infinity;
    if (isTablet) return 680;
    return 1200; // desktop
  }
}
