import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/providers/.providers.dart';

import '/utils/contants/transaction_categories.dart';

import '/widgets/buttons/custom_button.dart';
import '/widgets/screens/main/budget/budget_info_card.dart';
import '/widgets/screens/main/budget/empty_budget_text.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<BudgetsProvider>(
        builder: (context, budgetsProvider, _) {
          return Column(
            children: [
              Expanded(
                child: budgetsProvider.budgets.isNotEmpty
                    ? ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: [
                          ...budgetsProvider.budgets.map(
                            (el) {
                              return BudgetInfoCard(
                                category: el.category ??
                                    TransactionCategories.shopping,
                                usedAmount: el.currentAmount ?? 0,
                                estimatedAmount: el.estimatedAmount ?? 0,
                                showAlert: el.receiveAlert ?? false,
                                alertPercentage: el.alertPercentage ?? 0,
                                onTap: () {
                                  budgetsProvider.initializeDetailBudgetScreen(
                                    el,
                                  );
                                  Navigator.pushNamed(
                                    context,
                                    '/budget-detail',
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      )
                    : const EmptyBudgetText(),
              ),
              CustomButton(
                text: AppLocalizations.of(context)!.create_a_budget,
                margin: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 25,
                  bottom: 40,
                ),
                onTap: () {
                  budgetsProvider.resetCreateBudgetScreen();
                  Navigator.pushNamed(context, '/create-budget');
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
