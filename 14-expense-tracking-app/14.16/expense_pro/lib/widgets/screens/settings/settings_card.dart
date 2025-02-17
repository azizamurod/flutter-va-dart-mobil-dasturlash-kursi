import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key,
    required this.text,
    required this.value,
    required this.onTap,
  });

  final String text;
  final String value;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(41, 43, 45, 1),
            ),
          ),
          Row(
            children: [
              Text(
                value,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(145, 145, 159, 1),
                ),
              ),
              GestureDetector(
                onTap: () => onTap(),
                child: Container(
                  color: Colors.transparent,
                  child: SvgPicture.asset(
                    'assets/icons/arrow-right.svg',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
