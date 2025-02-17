import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/providers/.providers.dart';

import '/utils/contants/transaction_types.dart';
import '/utils/contants/transaction_categories.dart';
import '/utils/functions/get_text_for_transaction_categories.dart';

import '/widgets/bottom_sheets/show_select_transaction_categories_bottom_sheet.dart';

class CategorySwitcher extends StatelessWidget {
  const CategorySwitcher({
    super.key,
    required this.reportsProvider,
  });

  final ReportsProvider reportsProvider;

  @override
  Widget build(BuildContext context) {
    TransactionCategories? selectedCategory =
        reportsProvider.transactionType == TransactionTypes.expense
            ? reportsProvider.expenseCategory
            : reportsProvider.incomeCategory;
    return GestureDetector(
      onTap: () {
        showSelectTransactionCategoriesBottomSheet(
            context: context,
            categories:
                reportsProvider.transactionType == TransactionTypes.expense
                    ? expenseCategoriesList
                    : incomeCategoriesList,
            selected: [selectedCategory],
            select: (TransactionCategories val) {
              Navigator.pop(context);
              reportsProvider.transactionType == TransactionTypes.expense
                  ? reportsProvider.selectExpenseCategory(val)
                  : reportsProvider.selectIncomeCategory(val);
            });
      },
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: const EdgeInsets.only(
            top: 8,
            left: 8,
            bottom: 8,
            right: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: const Color.fromRGBO(241, 241, 250, 1),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icons/arrow-down.svg'),
              const SizedBox(width: 4),
              Text(
                selectedCategory != null
                    ? getTextForTransactionCategories(selectedCategory, context)
                    : AppLocalizations.of(context)!.category,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(33, 35, 37, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
