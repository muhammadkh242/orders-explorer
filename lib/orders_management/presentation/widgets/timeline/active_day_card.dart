import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../base/presentation/widgets/shadowed_card.dart';
import '../../../data/models/order.dart';

class ActiveDayCard extends StatelessWidget {
  const ActiveDayCard({super.key, required this.groupedOrders});

  final Map<DateTime?, List<Order>> groupedOrders;

  @override
  Widget build(BuildContext context) {
    final mostActiveDay = _getMostActiveDay();
    final averageOrders = groupedOrders.isEmpty
        ? 0
        : groupedOrders.values.map((e) => e.length).reduce((a, b) => a + b) ~/
            groupedOrders.length;

    return ShadowedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Most Active Day',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1A1F36),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF635BFF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.calendar_today,
                  color: Color(0xFF635BFF),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mostActiveDay,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1F36),
                    ),
                  ),
                  Text(
                    'Average $averageOrders orders',
                    style: const TextStyle(
                      color: Color(0xFF697386),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getMostActiveDay() {
    if (groupedOrders.isEmpty) return 'No Data';

    var maxOrders = 0;
    DateTime? mostActiveDate;

    groupedOrders.forEach((date, orders) {
      if (orders.length > maxOrders) {
        maxOrders = orders.length;
        mostActiveDate = date;
      }
    });

    return mostActiveDate != null
        ? DateFormat('EEEE, MMMM d').format(mostActiveDate!)
        : 'No Data';
  }
}
