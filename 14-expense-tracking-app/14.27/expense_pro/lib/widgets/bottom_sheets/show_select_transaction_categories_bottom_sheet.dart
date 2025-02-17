import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/utils/contants/transaction_categories.dart';
import '/utils/functions/get_icon_for_transaction_categories.dart';
import '/utils/functions/get_text_for_transaction_categories.dart';

import 'show_custom_bottom_sheet.dart';
import 'show_custom_bottom_sheet_with_button_at_the_top.dart';

void showSelectTransactionCategoriesBottomSheet({
  required BuildContext context,
  required List<TransactionCategories> categories,
  Function(TransactionCategories)? select,
  bool? canSelectMultiple,
  List<TransactionCategories?> selected = const [],
  Function(List<TransactionCategories?>)? selectMultiple,
}) {
  if (canSelectMultiple == true) {
    showCustomBottomSheetWithButtonAtTheTop(
      context: context,
      title: AppLocalizations.of(context)!.select_category,
      buttonText: AppLocalizations.of(context)!.select,
      onTapButton: () {
        if (selectMultiple != null) {
          selectMultiple(selected);
        }
        Navigator.pop(context);
      },
      child: StatefulBuilder(builder: (
        BuildContext context,
        StateSetter setState,
      ) {
        void selectCategory(TransactionCategories val) {
          if (selected.contains(val)) {
            setState(() => selected.remove(val));
          } else {
            setState(() => selected.add(val));
          }
        }

        return ListView(
          children: [
            ...categories.map(
              (el) {
                return SelectCategoryCard(
                  category: el,
                  isSelected: selected.contains(el),
                  onTap: () => selectCategory(el),
                );
              },
            ),
          ],
        );
      }),
    );
  } else {
    showCustomBottomSheet(
      context: context,
      title: AppLocalizations.of(context)!.select_category,
      child: Expanded(
        child: ListView(
          children: [
            ...categories.map(
              (el) {
                return SelectCategoryCard(
                  category: el,
                  isSelected: selected.contains(el),
                  onTap: () {
                    if (select != null) {
                      select(el);
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SelectCategoryCard extends StatelessWidget {
  const SelectCategoryCard({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  final TransactionCategories category;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: isSelected
              ? const Color.fromARGB(255, 248, 248, 248)
              : const Color.fromRGBO(252, 252, 252, 1),
          border: Border.all(
              color: isSelected
                  ? Colors.black.withOpacity(0.3)
                  : Colors.transparent),
        ),
        child: Row(
          children: [
            Image.asset(
              getIconForTransactionCategories(category),
            ),
            const SizedBox(width: 16),
            Text(
              getTextForTransactionCategories(category, context),
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
