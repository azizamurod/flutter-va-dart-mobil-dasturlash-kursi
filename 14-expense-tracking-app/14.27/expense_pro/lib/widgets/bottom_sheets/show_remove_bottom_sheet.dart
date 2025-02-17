import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'show_custom_bottom_sheet.dart';
import '/widgets/buttons/custom_button.dart';

void showRemoveBottomSheet({
  required BuildContext context,
  required Function remove,
  required String text,
}) {
  showCustomBottomSheet(
    context: context,
    title: AppLocalizations.of(context)!.remove_this_text(text),
    height: 240,
    child: Column(
      children: [
        Text(
          AppLocalizations.of(context)!.remove_agreement_text(text),
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
                text: AppLocalizations.of(context)!.no,
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
                text: AppLocalizations.of(context)!.yes,
                onTap: () {
                  Navigator.pop(context);
                  remove();
                },
              ),
            ),
          ],
        )
      ],
    ),
  );
}
