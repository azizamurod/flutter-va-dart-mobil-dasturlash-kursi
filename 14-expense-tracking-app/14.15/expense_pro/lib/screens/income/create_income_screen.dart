import 'package:flutter/material.dart';

import '/utils/contants/transaction_categories.dart';

import '/widgets/buttons/custom_button.dart';
import '/widgets/text_fields/select_card.dart';
import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/text_fields/custom_text_field.dart';
import '/widgets/text_fields/transaction_amount_text_field.dart';
import '/widgets/bottom_sheets/show_select_transaction_categories_bottom_sheet.dart';

class CreateIncomeScreen extends StatelessWidget {
  const CreateIncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 168, 107, 1),
      appBar: const CustomAppBar(title: 'Income'),
      body: Column(
        children: [
          const SizedBox(height: 59),
          TransactionAmountTextField(
            controller: TextEditingController(text: '0'),
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
                        isSelected: false,
                        onTap: () => showSelectTransactionCategoriesBottomSheet(
                          context: context,
                          categories: expenseCategoriesList,
                          select: (TransactionCategories el) {},
                        ),
                      ),
                      const SizedBox(height: 16),
                      SelectCard(
                        text: 'Wallet',
                        isSelected: true,
                        selectedText: 'Wallet 1',
                        onTap: () {},
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        hintText: 'Description',
                        controller: TextEditingController(),
                      ),
                    ],
                  ),
                  CustomButton(
                    text: 'Continue',
                    margin: const EdgeInsets.only(bottom: 32),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
