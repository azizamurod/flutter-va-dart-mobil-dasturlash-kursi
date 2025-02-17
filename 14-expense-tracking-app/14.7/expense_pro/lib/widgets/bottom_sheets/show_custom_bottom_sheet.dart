import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showCustomBottomSheet({
  required BuildContext context,
  required Widget child,
  required String title,
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
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            child,
          ],
        ),
      );
    },
  );
}
