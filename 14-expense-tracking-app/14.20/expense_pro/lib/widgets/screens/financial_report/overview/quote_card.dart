import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/widgets/buttons/custom_button.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 140,
            left: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '“Financial freedom is freedom from fear.”',
                style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                '-Robert Kiyoszaki',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        CustomButton(
          text: 'See the full detail',
          color: Colors.white,
          textColor: const Color.fromRGBO(127, 61, 255, 1),
          margin: const EdgeInsets.all(16),
          onTap: () => Navigator.pushNamed(
            context,
            '/financial-report-detail',
          ),
        ),
      ],
    );
  }
}
