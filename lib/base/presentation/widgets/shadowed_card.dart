import 'package:flutter/material.dart';

class ShadowedCard extends StatelessWidget {
  const ShadowedCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
          // Subtle ambient shadow
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
/*        border: Border.all(
          color: colorScheme.outlineVariant,
          width: 1,
        ),*/
      ),
      child: child,
    );
  }
}