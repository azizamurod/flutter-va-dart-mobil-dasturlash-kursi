import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/utils/contants/transaction_categories.dart';
import '/utils/functions/get_icon_for_transaction_categories.dart';
import '/utils/functions/get_text_for_transaction_categories.dart';

import 'show_custom_bottom_sheet.dart';

void showSelectTransactionCategoriesBottomSheet({
  required BuildContext context,
  required List<TransactionCategories> categories,
  required Function(TransactionCategories) select,
}) {
  showCustomBottomSheet(
    context: context,
    child: Expanded(
      child: ListView(
        children: [
          ...categories.map(
            (el) {
              return SelectCategoryCard(
                category: el,
                isSelected: false,
                onTap: () => select(el),
              );
            },
          ),
        ],
      ),
    ),
  );
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
              getTextForTransactionCategories(category),
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
