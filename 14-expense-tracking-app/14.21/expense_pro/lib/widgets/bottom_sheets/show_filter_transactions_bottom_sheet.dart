
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/providers/.providers.dart';

import '/utils/contants/sorting_types.dart';
import '/utils/contants/transaction_types.dart';
import '/utils/contants/transaction_categories.dart';

import '/widgets/buttons/custom_button.dart';
import '/widgets/buttons/rounded_button.dart';
import '/widgets/bottom_sheets/show_custom_bottom_sheet_with_button_at_the_top.dart';
import '/widgets/bottom_sheets/show_select_transaction_categories_bottom_sheet.dart';

void showFilterTransactionsBottomSheet({
  required BuildContext context,
  required TransactionsProvider transactionsProvider,
}) {
  TransactionTypes? type = transactionsProvider.transactionType;
  SortingTypes? sorting = transactionsProvider.sorting;
  List<TransactionCategories?> categories = transactionsProvider.categories;

  showCustomBottomSheetWithButtonAtTheTop(
    context: context,
    title: 'Filter Transactions',
    buttonText: 'Reset',
    onTapButton: () {
      transactionsProvider.reset();
      Navigator.pop(context);
    },
    child: StatefulBuilder(builder: (
      BuildContext context,
      StateSetter setState,
    ) {
      void selectType(TransactionTypes val) {
        setState(() {
          type = type == val ? null : val;
        });
      }

      void selectSorting(SortingTypes val) {
        setState(() {
          sorting = sorting == val ? null : val;
        });
      }

      void selectCategories(List<TransactionCategories?> val) {
        setState(() => categories = val);
      }

      return ListView(
        children: [
          Text(
            'Filter By',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(13, 14, 15, 1),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              RoundedButton(
                text: 'Income',
                isActive: type == TransactionTypes.income,
                onTap: () => selectType(TransactionTypes.income),
              ),
              RoundedButton(
                text: 'Expense',
                isActive: type == TransactionTypes.expense,
                onTap: () => selectType(TransactionTypes.expense),
              ),
              RoundedButton(
                text: 'Transfer',
                isActive: type == TransactionTypes.transfer,
                onTap: () => selectType(TransactionTypes.transfer),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Sort By',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(13, 14, 15, 1),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              RoundedButton(
                text: 'Highest',
                isActive: sorting == SortingTypes.highest,
                onTap: () => selectSorting(SortingTypes.highest),
              ),
              RoundedButton(
                text: 'Lowest',
                isActive: sorting == SortingTypes.lowest,
                onTap: () => selectSorting(SortingTypes.lowest),
              ),
              RoundedButton(
                text: 'Newest',
                isActive: sorting == SortingTypes.newest,
                onTap: () => selectSorting(SortingTypes.newest),
              ),
              RoundedButton(
                text: 'Oldest',
                isActive: sorting == SortingTypes.oldest,
                onTap: () => selectSorting(SortingTypes.oldest),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Category',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(13, 14, 15, 1),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Choose Category',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(41, 43, 45, 1),
                  ),
                ),
                GestureDetector(
                  onTap: () => showSelectTransactionCategoriesBottomSheet(
                    context: context,
                    categories: type == null
                        ? [
                            ...expenseCategoriesList,
                            ...incomeCategoriesList,
                            TransactionCategories.transfer,
                          ]
                        : (type == TransactionTypes.income
                            ? incomeCategoriesList
                            : (type == TransactionTypes.expense
                                ? expenseCategoriesList
                                : [TransactionCategories.transfer])),
                    canSelectMultiple: true,
                    selected: categories,
                    selectMultiple: selectCategories,
                  ),
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Text(
                          '${categories.length} Selected',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(145, 145, 159, 1),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/arrow-right.svg',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          CustomButton(
            text: 'Apply',
            onTap: () {
              transactionsProvider.applyFilters(
                type: type,
                sorting: sorting,
                categories: categories,
              );
              Navigator.pop(context);
            },
            margin: const EdgeInsets.symmetric(vertical: 16),
          ),
        ],
      );
    }),
  );
}
