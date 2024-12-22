import 'package:flutter/material.dart';

import 'metrics_card.dart';

class MetricsSection extends StatelessWidget {
  const MetricsSection({
    super.key,
    required this.totalOrders,
    required this.averagePrice,
    required this.returnsCount,
    required this.totalRevenue,
  });

  final int? totalOrders;
  final double? averagePrice;
  final int? returnsCount;
  final double? totalRevenue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MetricsCard(
          icon: Icons.shopping_bag_outlined,
          value: totalOrders ?? 0.0,
          title: 'Total Orders',
          color: const Color(0xFF635BFF),
        ),
        const SizedBox(height: 16),

        MetricsCard(
          icon: Icons.assignment_return_outlined,
          value: returnsCount ?? 0.0,
          title: 'Returns',
          color: const Color(0xFFFF4242),
        ),
        const SizedBox(height: 16),

        MetricsCard(
          icon: Icons.attach_money_outlined,
          value: averagePrice ?? 0.0,
          title: 'Average Price',
          color: const Color(0xFF00D924),
          currencyFormat: true,
        ),
        const SizedBox(height: 16),

        MetricsCard(
          icon: Icons.account_balance_outlined,
          value: totalRevenue ?? 0.0,
          title: 'Total Revenue',
          color: const Color(0xFF0066FF),
          currencyFormat: true,
        ),
/*        Row(
          children: [
            Expanded(
              child: MetricsCard(
                icon: Icons.shopping_bag_outlined,
                value: totalOrders ?? 0.0,
                title: 'Total Orders',
                color: const Color(0xFF635BFF),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: MetricsCard(
                icon: Icons.assignment_return_outlined,
                value: returnsCount ?? 0.0,
                title: 'Returns',
                color: const Color(0xFFFF4242),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: MetricsCard(
                icon: Icons.attach_money_outlined,
                value: averagePrice ?? 0.0,
                title: 'Average Price',
                color: const Color(0xFF00D924),
                currencyFormat: true,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: MetricsCard(
                icon: Icons.account_balance_outlined,
                value: totalRevenue ?? 0.0,
                title: 'Total Revenue',
                color: const Color(0xFF0066FF),
                currencyFormat: true,
              ),
            ),
          ],
        ),*/
      ],
    );
  }
}
