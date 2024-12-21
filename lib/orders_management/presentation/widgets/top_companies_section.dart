import 'package:flutter/material.dart';
import 'package:orders_explorer/orders_management/presentation/widgets/company_item.dart';
import 'package:orders_explorer/orders_management/presentation/widgets/shadowed_card.dart';

import '../../domain/entities/company.dart';

class TopCompaniesSection extends StatelessWidget {
  const TopCompaniesSection({super.key, required this.companies});

  final List<Company> companies;

  @override
  Widget build(BuildContext context) {
    return ShadowedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Companies by Order Value',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1F36),
            ),
          ),
          const SizedBox(height: 24),
          ...List.generate(companies.length, (index) {
            final company = companies[index];
            return Padding(
              padding: EdgeInsets.only(
                  bottom: index != companies.length - 1 ? 16.0 : 0),
              child: CompanyItem(company: company),
            );
          }),
        ],
      ),
    );
  }
}
