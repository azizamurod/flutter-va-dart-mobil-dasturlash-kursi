import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/providers/.providers.dart';

import '/utils/contants/sorting_types.dart';
import '/utils/contants/transaction_types.dart';
import '/utils/contants/transaction_categories.dart';
import '/utils/functions/get_text_for_transaction_types.dart';

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
    title: AppLocalizations.of(context)!.filter_transactions,
    buttonText: AppLocalizations.of(context)!.reset,
    onTapButton: () {
      transactionsProvider.reset(context);
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
            AppLocalizations.of(context)!.filter_by,
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
                text: getTextForTransactionTypes(TransactionTypes.income, context,),
                isActive: type == TransactionTypes.income,
                onTap: () => selectType(TransactionTypes.income),
              ),
              RoundedButton(
                text: getTextForTransactionTypes(TransactionTypes.expense, context,),
                isActive: type == TransactionTypes.expense,
                onTap: () => selectType(TransactionTypes.expense),
              ),
              RoundedButton(
                text: getTextForTransactionTypes(TransactionTypes.transfer, context,),
                isActive: type == TransactionTypes.transfer,
                onTap: () => selectType(TransactionTypes.transfer),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.sort_by,
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
                text: AppLocalizations.of(context)!.highest,
                isActive: sorting == SortingTypes.highest,
                onTap: () => selectSorting(SortingTypes.highest),
              ),
              RoundedButton(
                text: AppLocalizations.of(context)!.lowest,
                isActive: sorting == SortingTypes.lowest,
                onTap: () => selectSorting(SortingTypes.lowest),
              ),
              RoundedButton(
                text: AppLocalizations.of(context)!.newest,
                isActive: sorting == SortingTypes.newest,
                onTap: () => selectSorting(SortingTypes.newest),
              ),
              RoundedButton(
                text: AppLocalizations.of(context)!.oldest,
                isActive: sorting == SortingTypes.oldest,
                onTap: () => selectSorting(SortingTypes.oldest),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.category,
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
                  AppLocalizations.of(context)!.choose_category,
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
                          '${categories.length} ${AppLocalizations.of(context)!.selected}',
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
            text: AppLocalizations.of(context)!.apply,
            onTap: () {
              transactionsProvider.applyFilters(
                type: type,
                sorting: sorting,
                categories: categories,
                context: context,
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
