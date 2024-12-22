import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../data/models/order.dart';

class TimeLineChart extends StatelessWidget {
  const TimeLineChart({
    super.key,
    required this.groupedOrders,
    required this.startDate
  });

  final Map<DateTime, List<Order>> groupedOrders;
  final DateTime startDate;

  @override
  Widget build(BuildContext context) {
    final days = List.generate(
        7,
            (index) => DateTime(
          startDate.year,
          startDate.month,
          startDate.day + index,
        )
    );

    double maxOrders = 0;
    for (var orders in groupedOrders.values) {
      if (orders.length > maxOrders) maxOrders = orders.length.toDouble();
    }
    maxOrders = maxOrders < 5 ? 5 : maxOrders * 1.2;

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: const Color(0xFF1A1F36),
            tooltipRoundedRadius: 8,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              final date = days[groupIndex];
              final ordersForDay = groupedOrders[date] ?? [];
              return BarTooltipItem(
                '${DateFormat('MMM dd').format(date)}\n${ordersForDay.length} orders',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              );
            },
          ),
        ),
        gridData: const FlGridData(show: false),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (value, meta) {
                final date = days[value.toInt()];
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    DateFormat('dd').format(date),
                    style: const TextStyle(
                      color: Color(0xFF697386),
                      fontSize: 12,
                    ),
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: maxOrders <= 5 ? 1 : 20,
              reservedSize: 25,
              getTitlesWidget: (value, meta) {
                return Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Text(
                    value.toInt().toString(),
                    style: const TextStyle(
                      color: Color(0xFF697386),
                      fontSize: 12,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: List.generate(
          7,
              (index) {
            final date = days[index];
            final ordersForDay = groupedOrders[date] ?? [];

            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: ordersForDay.length.toDouble(),
                  color: const Color(0xFF635BFF),
                  width: 16,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(4),
                  ),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: maxOrders,
                    color: const Color(0xFFE3E8EF),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}