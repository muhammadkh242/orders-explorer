import 'package:flutter/material.dart';
import 'package:orders_explorer/base/presentation/widgets/shadowed_card.dart';

class LinearProgressCard extends StatelessWidget {
  const LinearProgressCard({
    super.key,
    required this.returnsCount,
    required this.totalOrders,
  });

  final int? returnsCount;
  final int? totalOrders;

  @override
  Widget build(BuildContext context) {
    double percentage = 0.0;
    if ((totalOrders ?? 0) > 0) {
      percentage = (returnsCount ?? 0) / (totalOrders ?? 1);
      percentage = percentage.clamp(0.0, 1.0);
    }

    return ShadowedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Returns Rate',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1F36),
            ),
          ),
          const SizedBox(height: 24),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: percentage,
              backgroundColor: const Color(0xFFE3E8EF),
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF635BFF)),
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${(percentage * 100).toStringAsFixed(1)}% return rate',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A1F36),
                ),
              ),
              Text(
                '${returnsCount ?? 0} of ${totalOrders ?? 0} orders',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF697386),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}