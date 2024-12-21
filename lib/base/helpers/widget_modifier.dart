import 'package:flutter/material.dart';

extension WidgetModifier on Widget {
  Padding paddingAll(double value) {
    return Padding(
      padding: EdgeInsetsDirectional.all(value),
      child: this,
    );
  }

  Padding paddingOnly(
      {double? start, double? end, double? top, double? bottom}) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: start ?? 0,
        end: end ?? 0,
        top: top ?? 0,
        bottom: bottom ?? 0,
      ),
      child: this,
    );
  }

  Padding paddingVertical(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: value),
      child: this,
    );
  }

  Padding paddingHorizontal(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value),
      child: this,
    );
  }
  Widget cornerRadius(BorderRadiusDirectional radius) {
    return ClipRRect(
      borderRadius: radius,
      child: this,
    );
  }
}
