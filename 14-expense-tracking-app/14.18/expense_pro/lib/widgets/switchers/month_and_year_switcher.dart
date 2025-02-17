import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MonthAndYearSwitcher extends StatelessWidget {
  const MonthAndYearSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: const EdgeInsets.only(
            top: 8,
            left: 8,
            bottom: 8,
            right: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: const Color.fromRGBO(241, 241, 250, 1),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icons/arrow-down.svg'),
              const SizedBox(width: 4),
              Text(
                "December, 2024",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(33, 35, 37, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
