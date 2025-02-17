import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.text,
    required this.isActive,
    required this.onTap,
    this.borderRadius = 24,
    this.padding = const EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 24,
    ),
  });

  final String text;
  final bool isActive;
  final Function onTap;

  final double borderRadius;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color:
              isActive ? const Color.fromRGBO(238, 229, 255, 1) : Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: isActive
                ? const Color.fromRGBO(238, 229, 255, 1)
                : const Color.fromRGBO(227, 229, 229, 1),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isActive
                ? const Color.fromRGBO(127, 61, 255, 1)
                : const Color.fromRGBO(13, 14, 15, 1),
          ),
        ),
      ),
    );
  }
}
