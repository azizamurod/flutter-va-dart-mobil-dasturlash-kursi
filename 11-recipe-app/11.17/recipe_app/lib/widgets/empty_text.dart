import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyText extends StatelessWidget {
  const EmptyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          "There are no items",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(156, 163, 175, 1),
          ),
        ),
      );
  }
}
