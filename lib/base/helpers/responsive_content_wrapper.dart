import 'package:flutter/material.dart';
import 'package:orders_explorer/base/helpers/responsive_helper.dart';

class ResponsiveContentWrapper extends StatelessWidget {
  final Widget child;

  const ResponsiveContentWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: context.maxContentWidth,
        ),
        child: child,
      ),
    );
  }
}
