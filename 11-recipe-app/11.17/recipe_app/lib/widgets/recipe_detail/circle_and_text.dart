import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CircleAndTextItem extends StatelessWidget {
  const CircleAndTextItem({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6, right: 5, left: 5, bottom: 5),
            child: Icon(
              Icons.circle,
              size: 7,
              color: Color.fromRGBO(100, 116, 139, 1),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(100, 116, 139, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
