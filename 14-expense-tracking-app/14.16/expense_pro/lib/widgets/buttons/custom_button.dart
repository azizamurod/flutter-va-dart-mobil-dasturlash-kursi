import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,

    // decoration
    this.color,
    this.textColor,
    this.borderRadius = 16,

    // size
    this.height = 64,
    this.margin,
  });

  final String text;
  final Function onTap;

  // decoration
  final Color? color;
  final Color? textColor;
  final double borderRadius;

  // size
  final double height;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: height,
        width: double.infinity,
        margin: margin,
        decoration: BoxDecoration(
          color: color ?? const Color.fromRGBO(127, 61, 255, 1),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
