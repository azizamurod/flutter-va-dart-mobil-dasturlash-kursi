import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/utils/contants/transaction_categories.dart';

import '/widgets/buttons/custom_button.dart';
import '/widgets/buttons/rounded_button.dart';
import '/widgets/bottom_sheets/show_custom_bottom_sheet_with_button_at_the_top.dart';
import '/widgets/bottom_sheets/show_select_transaction_categories_bottom_sheet.dart';

void showFilterTransactionsBottomSheet({
  required BuildContext context,
  required Function reset,
  required Function apply,
}) {
  showCustomBottomSheetWithButtonAtTheTop(
    context: context,
    title: 'Filter Transactions',
    buttonText: 'Reset',
    onTapButton: reset,
    child: ListView(
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
              isActive: false,
              onTap: () {},
            ),
            RoundedButton(
              text: 'Expense',
              isActive: true,
              onTap: () {},
            ),
            RoundedButton(
              text: 'Transfer',
              isActive: false,
              onTap: () {},
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
              isActive: false,
              onTap: () {},
            ),
            RoundedButton(
              text: 'Lowest',
              isActive: false,
              onTap: () {},
            ),
            RoundedButton(
              text: 'Newest',
              isActive: false,
              onTap: () {},
            ),
            RoundedButton(
              text: 'Oldest',
              isActive: false,
              onTap: () {},
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
                  categories: expenseCategoriesList,
                  canSelectMultiple: true,
                  select: (TransactionCategories el) {
                    Navigator.pop(context);
                  },
                  selectMultiple: (List<TransactionCategories> el) {
                    Navigator.pop(context);
                  },
                ),
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Text(
                        '0 Selected',
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
          onTap: apply,
          margin: const EdgeInsets.symmetric(vertical: 16),
        ),
      ],
    ),
  );
}
