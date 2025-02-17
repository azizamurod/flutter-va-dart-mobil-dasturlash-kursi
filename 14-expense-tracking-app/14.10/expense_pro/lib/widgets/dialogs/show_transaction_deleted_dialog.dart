import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

void showTransactionDeletedDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Future.delayed(
        const Duration(seconds: 2),
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
              'Transaction has been successfully removed',
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
