import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimelineDateFilter extends StatelessWidget {
  const TimelineDateFilter({
    super.key,
    required this.currentDate,
    required this.startDate,
    required this.endDate,
    required this.onDateFilterChanged,
  });

  final DateTime currentDate;
  final DateTime startDate;
  final DateTime endDate;
  final Function(DateTime, DateTime) onDateFilterChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Daily Orders',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1F36),
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, size: 18),
              onPressed: () {
                onDateFilterChanged(
                  startDate
                      .copyWith(
                          year: startDate.year,
                          day: startDate.day,
                          month: startDate.month)
                      .subtract(const Duration(days: 7)),
                  startDate
                      .copyWith(
                          year: startDate.year,
                          day: startDate.day,
                          month: startDate.month)
                      .subtract(
                        const Duration(days: 1),
                      ),
                );
              },
            ),
            Text(
              '${DateFormat('MMM dd').format(startDate)} - ${DateFormat('MMM dd').format(endDate)}',
              style: const TextStyle(
                color: Color(0xFF697386),
                fontWeight: FontWeight.w500,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, size: 18),
              onPressed: endDate.isBefore(currentDate)
                  ? () {
                      onDateFilterChanged(
                        endDate
                            .copyWith(
                                day: endDate.day,
                                year: endDate.year,
                                month: endDate.month)
                            .add(
                              const Duration(days: 1),
                            ),
                        endDate
                            .copyWith(
                                day: endDate.day,
                                year: endDate.year,
                                month: endDate.month)
                            .add(
                              const Duration(days: 7),
                            ),
                      );
                    }
                  : null,
            ),
          ],
        ),
      ],
    );
  }
}
