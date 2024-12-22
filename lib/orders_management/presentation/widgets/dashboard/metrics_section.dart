import 'package:flutter/material.dart';
import 'package:orders_explorer/base/helpers/responsive_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveRowColumn(
          rowSpacing: 16,
          columnSpacing: 16,
          layout: context.isMinimized
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: MetricsCard(
                icon: Icons.shopping_bag_outlined,
                value: totalOrders ?? 0.0,
                title: 'Total Orders',
                color: colorScheme.primary,
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: MetricsCard(
                icon: Icons.assignment_return_outlined,
                value: returnsCount ?? 0.0,
                title: 'Returns',
                color: colorScheme.error,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ResponsiveRowColumn(
          rowSpacing: 16,
          columnSpacing: 16,
          layout: context.isMinimized
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: MetricsCard(
                icon: Icons.attach_money_outlined,
                value: averagePrice ?? 0.0,
                title: 'Average Price',
                color: colorScheme.tertiary,
                currencyFormat: true,
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: MetricsCard(
                icon: Icons.account_balance_outlined,
                value: totalRevenue ?? 0.0,
                title: 'Total Revenue',
                color: colorScheme.secondary,
                currencyFormat: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}