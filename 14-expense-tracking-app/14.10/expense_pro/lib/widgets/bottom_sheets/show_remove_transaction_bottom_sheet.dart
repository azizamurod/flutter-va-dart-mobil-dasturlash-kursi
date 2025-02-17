import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'show_custom_bottom_sheet.dart';
import '/widgets/buttons/custom_button.dart';

void showRemoveTransactionBottomSheet({
  required BuildContext context,
  required Function remove,
}) {
  showCustomBottomSheet(
    context: context,
    title: 'Remove this transaction?',
    height: 240,
    child: Column(
      children: [
        Text(
          'Are you sure do you wanna remove this transaction?',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(145, 145, 159, 1),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Flexible(
              child: CustomButton(
                text: 'No',
                color: const Color.fromRGBO(238, 229, 255, 1),
                textColor: const Color.fromRGBO(127, 61, 255, 1),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: CustomButton(
                text: 'Yes',
                onTap: () => remove(),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
