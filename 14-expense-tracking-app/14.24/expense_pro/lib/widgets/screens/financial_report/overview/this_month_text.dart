import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThisMonthText extends StatelessWidget {
  const ThisMonthText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Text(
        'This Month',
        style: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
