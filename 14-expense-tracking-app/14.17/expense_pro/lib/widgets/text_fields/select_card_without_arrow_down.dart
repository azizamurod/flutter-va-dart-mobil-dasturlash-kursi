import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectCardWithoutArrowDown extends StatelessWidget {
  const SelectCardWithoutArrowDown({
    super.key,
    required this.text,
    this.selectedText,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final String? selectedText;
  final bool isSelected;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 18,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color.fromRGBO(241, 241, 250, 1),
            ),
          ),
          child: isSelected
              ? Text(
                  selectedText ?? '',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(41, 43, 45, 1),
                  ),
                )
              : Text(
                  text,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(145, 145, 159, 1),
                  ),
                ),
        ),
      ),
    );
  }
}
