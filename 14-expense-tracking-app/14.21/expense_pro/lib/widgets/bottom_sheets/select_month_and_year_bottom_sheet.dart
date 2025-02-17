import 'package:flutter/material.dart';

import 'show_custom_bottom_sheet.dart';
import 'show_select_accounts_bottom_sheet.dart';

void showSelectMonthAndYearBottomSheet({
  required BuildContext context,
  required Function(String) onTap,
  required List<String> months,
  String? selected,
}) {
  showCustomBottomSheet(
    context: context,
    title: 'Select Month',
    child: Expanded(
      child: ListView(
        children: [
          ...months.map(
            (el) {
              return SelectAccountCard(
                name: el,
                isSelected: el == selected,
                onTap: () => onTap(el),
              );
            },
          ),
        ],
      ),
    ),
  );
}
