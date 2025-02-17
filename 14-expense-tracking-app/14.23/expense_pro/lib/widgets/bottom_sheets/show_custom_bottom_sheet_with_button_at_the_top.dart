import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/widgets/buttons/rounded_button.dart';

void showCustomBottomSheetWithButtonAtTheTop({
  required BuildContext context,
  required String title,
  required String buttonText,
  required Function onTapButton,
  required Widget child,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 12,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            Container(
              height: 4,
              width: 36,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(211, 189, 255, 1),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                RoundedButton(
                  text: buttonText,
                  isActive: true,
                  onTap: onTapButton,
                  borderRadius: 40,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(child: child),
          ],
        ),
      );
    },
  );
}
