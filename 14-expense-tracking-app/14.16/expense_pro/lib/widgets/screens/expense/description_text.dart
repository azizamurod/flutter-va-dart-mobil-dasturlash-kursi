import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionDescriptionText extends StatelessWidget {
  const TransactionDescriptionText({
    super.key,
    required this.description,
  });

  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(145, 145, 159, 1),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(13, 14, 15, 1),
            ),
          ),
        ],
      ),
    );
  }
}
