import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:orders_explorer/base/presentation/widgets/shadowed_card.dart';

class MetricsCard extends StatelessWidget {
  const MetricsCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.currencyFormat = false,
  });

  final String title;
  final num value;
  final IconData icon;
  final Color color;
  final bool currencyFormat;

  @override
  Widget build(BuildContext context) {
    return ShadowedCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF1A1F36),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F9FC),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    currencyFormat
                        ? '\$ ${NumberFormat('#,##0.00').format(value)}'
                        : NumberFormat('#,###').format(value),
                    style: const TextStyle(
                      color: Color(0xFF1A1F36),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}