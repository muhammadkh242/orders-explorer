import 'package:flutter/material.dart';
import '../../../../base/presentation/widgets/shadowed_card.dart';
import '../../../data/models/order.dart';

class LastSevenDaysOrdersCard extends StatelessWidget {
  const LastSevenDaysOrdersCard({super.key, required this.groupedOrders});

  final Map<DateTime?, List<Order>> groupedOrders;

  @override
  Widget build(BuildContext context) {
    final totalOrders = groupedOrders.isEmpty
        ? 0
        : groupedOrders.values.map((orders) => orders.length).reduce((a, b) => a + b);

    return ShadowedCard(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF635BFF).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.calendar_view_week,
                color: Color(0xFF635BFF),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Last 7 Days Orders',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF697386),
                  ),
                ),
                Text(
                  totalOrders.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1F36),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}