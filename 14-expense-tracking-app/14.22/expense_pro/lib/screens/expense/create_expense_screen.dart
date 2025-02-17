
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/data/drift/drift_db.dart';
import '/providers/.providers.dart';

import '/utils/contants/transaction_types.dart';
import '/utils/contants/transaction_categories.dart';
import '/utils/functions/get_text_for_transaction_categories.dart';

import '/widgets/buttons/custom_button.dart';
import '/widgets/text_fields/select_card.dart';
import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/text_fields/custom_text_field.dart';
import '/widgets/text_fields/transaction_amount_text_field.dart';
import '/widgets/bottom_sheets/show_select_accounts_bottom_sheet.dart';
import '/widgets/bottom_sheets/show_select_transaction_categories_bottom_sheet.dart';

class CreateExpenseScreen extends StatelessWidget {
  const CreateExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context
        .read<TransactionsProvider>()
        .initializeCreateScreen(TransactionTypes.expense);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 60, 74, 1),
      appBar: const CustomAppBar(title: 'Expense'),
      body: Consumer<TransactionsProvider>(
          builder: (context, transactionsProvider, child) {
        return Column(
          children: [
            const SizedBox(height: 59),
            TransactionAmountTextField(
              controller: transactionsProvider.amountController,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 24,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SelectCard(
                          text: 'Category',
                          isSelected: transactionsProvider
                                  .transactionForCreation?.category !=
                              null,
                          selectedText: getTextForTransactionCategories(
                            transactionsProvider
                                .transactionForCreation?.category,
                          ),
                          onTap: () =>
                              showSelectTransactionCategoriesBottomSheet(
                            context: context,
                            categories: expenseCategoriesList,
                            selected: [
                              transactionsProvider
                                  .transactionForCreation?.category
                            ],
                            select: (TransactionCategories el) {
                              transactionsProvider.selectCategory(el);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        SelectCard(
                          text: 'Account',
                          isSelected: transactionsProvider
                                  .transactionForCreation?.account !=
                              null,
                          selectedText: transactionsProvider
                              .transactionForCreation?.account?.name,
                          onTap: () => showSelectAccountsBottomSheet(
                            context: context,
                            selected: transactionsProvider
                                .transactionForCreation?.account,
                            select: (Account el) {
                              transactionsProvider.selectAccount(el);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          hintText: 'Description',
                          controller:
                              transactionsProvider.descriptionController,
                        ),
                      ],
                    ),
                    CustomButton(
                      text: 'Continue',
                      margin: const EdgeInsets.only(bottom: 32),
                      onTap: () => transactionsProvider.createTransaction(context,),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
