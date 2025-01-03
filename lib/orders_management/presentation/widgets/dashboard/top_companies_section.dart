import 'package:flutter/material.dart';
import 'package:orders_explorer/base/presentation/widgets/shadowed_card.dart';

import '../../../domain/entities/company.dart';
import 'company_item.dart';

class TopCompaniesSection extends StatelessWidget {
  const TopCompaniesSection({super.key, required this.companies});

  final List<Company> companies;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ShadowedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Companies by Order Value',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
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
