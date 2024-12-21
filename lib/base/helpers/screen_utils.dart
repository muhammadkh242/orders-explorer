import 'package:flutter/cupertino.dart';
import 'package:responsive_framework/responsive_framework.dart';

mixin ScreenUtils{
  bool isMobile(BuildContext context) => ResponsiveBreakpoints.of(context).smallerThan(TABLET);
}