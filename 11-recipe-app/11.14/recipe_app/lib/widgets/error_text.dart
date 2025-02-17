import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          "Please try later",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(156, 163, 175, 1),
          ),
        ),
      );
  }
}
