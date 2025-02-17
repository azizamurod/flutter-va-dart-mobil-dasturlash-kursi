import 'package:flutter/material.dart';

import '/utils/contants/transaction_categories.dart';

import '/widgets/buttons/custom_button.dart';
import '/widgets/screens/main/budget/budget_info_card.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                ...[
                  {
                    'category': TransactionCategories.shopping,
                    'used_amount': 1200.0,
                    'estimated_amount': 1000.0,
                    'show_alert': true,
                    'alert_percentage': 80,
                  },
                  {
                    'category': TransactionCategories.transportation,
                    'used_amount': 350.0,
                    'estimated_amount': 700.0,
                    'show_alert': true,
                    'alert_percentage': 80,
                  },
                  {
                    'category': TransactionCategories.shopping,
                    'used_amount': 1200.0,
                    'estimated_amount': 1000.0,
                    'show_alert': false,
                    'alert_percentage': 80,
                  },
                  {
                    'category': TransactionCategories.shopping,
                    'used_amount': 800.0,
                    'estimated_amount': 1000.0,
                    'show_alert': false,
                    'alert_percentage': 80,
                  },
                  {
                    'category': TransactionCategories.shopping,
                    'used_amount': 800.0,
                    'estimated_amount': 1000.0,
                    'show_alert': true,
                    'alert_percentage': 80,
                  },
                ].map((el) {
                  return BudgetInfoCard(
                    category: el['category'] as TransactionCategories,
                    usedAmount: el['used_amount'] as double,
                    estimatedAmount: el['estimated_amount'] as double,
                    showAlert: el['show_alert'] as bool,
                    alertPercentage: el['alert_percentage'] as int,
                    onTap: () {
                      Navigator.pushNamed(context, '/budget-detail');
                    },
                  );
                })
              ],
            ),
          ),
          CustomButton(
            text: 'Create a budget',
            margin: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 25,
              bottom: 40,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
    // const EmptyBudgetText(),
  }
}
