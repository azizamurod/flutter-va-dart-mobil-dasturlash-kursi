import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchHistoryItem extends StatelessWidget {
  const SearchHistoryItem({
    super.key,
    required this.text,
    required this.onTap,
    required this.remove,
  });

  final String text;
  final Function onTap;
  final Function remove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: ()=>onTap(),
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(116, 129, 137, 1),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => remove(),
            child: Image.asset("assets/icons/remove.png"),
          ),
        ],
      ),
    );
  }
}
