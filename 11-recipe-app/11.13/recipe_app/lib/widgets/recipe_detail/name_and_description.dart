import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NameAndDescription extends StatelessWidget {
  const NameAndDescription({
    super.key,
    required this.name,
    required this.description,
  });

  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(15, 23, 42, 1),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Description",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(15, 23, 42, 1),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(100, 116, 139, 1),
          ),
        ),
      ],
    );
  }
}
