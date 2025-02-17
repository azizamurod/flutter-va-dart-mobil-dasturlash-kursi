import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showDeletedDialog({
  required BuildContext context,
  required String text,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      Future.delayed(
        const Duration(milliseconds: 1500),
        () {
          Navigator.pop(context);
        },
      );
      return AlertDialog(
        contentPadding: const EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            SvgPicture.asset(
              'assets/icons/success.svg',
              width: 48,
              height: 48,
              colorFilter: const ColorFilter.mode(
                Color.fromRGBO(82, 51, 255, 1),
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.removed_text(text),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            )
          ],
        ),
      );
    },
  );
}
