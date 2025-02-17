import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyBudgetText extends StatelessWidget {
  const EmptyBudgetText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'You don’t have a budget.',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(145, 145, 159, 1),
            ),
          ),
          Text(
            'Let’s make one so you in control.',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(145, 145, 159, 1),
            ),
          ),
        ],
      ),
    );
  }
}
