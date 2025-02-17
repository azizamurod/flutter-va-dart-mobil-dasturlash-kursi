import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({
    super.key,
    required this.number,
    required this.onTap,
  });

  final String number;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: Colors.transparent,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            number,
            style: GoogleFonts.inter(
              fontSize: 48,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

