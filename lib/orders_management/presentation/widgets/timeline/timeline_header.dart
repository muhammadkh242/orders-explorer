import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimelineHeader extends StatelessWidget {
  const TimelineHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Text(
      'Today: ${DateFormat('MMM dd, yyyy').format(DateTime(2021, 10, 31))}',
      style: TextStyle(
        fontSize: 16,
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }
}
