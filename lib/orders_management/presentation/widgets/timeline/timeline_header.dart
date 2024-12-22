import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimelineHeader extends StatelessWidget {
  const TimelineHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Today: ${DateFormat('MMM dd, yyyy').format(DateTime(2021, 10, 31))}',
      style: const TextStyle(
        fontSize: 16,
        color: Color(0xFF697386),
      ),
    );
  }
}
