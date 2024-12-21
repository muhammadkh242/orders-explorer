import 'package:flutter/material.dart';
import 'package:orders_explorer/orders_management/domain/entities/company.dart';

class CompanyItem extends StatelessWidget {
  const CompanyItem({super.key, required this.company});

  final Company company;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: company.color?.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              '1',
              style: TextStyle(
                color: company.color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                company.name ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1F36),
                ),
              ),
              Text(
                '\$${company.ordersTotalPrice?.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF697386),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 60,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: company.color,
          ),
        ),
      ],
    );
  }
}
