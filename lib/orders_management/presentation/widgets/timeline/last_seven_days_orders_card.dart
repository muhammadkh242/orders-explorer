import 'package:flutter/material.dart';

import '../../../../base/presentation/widgets/shadowed_card.dart';
import '../../../data/models/order.dart';

class LastSevenDaysOrdersCard extends StatelessWidget {
  const LastSevenDaysOrdersCard({super.key, required this.groupedOrders});

  final Map<DateTime?, List<Order>> groupedOrders;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final totalOrders = groupedOrders.isEmpty
        ? 0
        : groupedOrders.values
            .map((orders) => orders.length)
            .reduce((a, b) => a + b);

    return ShadowedCard(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.calendar_view_week,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Last 7 Days Orders',
                  style: TextStyle(
                    fontSize: 14,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  totalOrders.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
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
