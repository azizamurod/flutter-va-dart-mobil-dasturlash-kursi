import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsSelectCard extends StatelessWidget {
  const SettingsSelectCard({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(13, 14, 15, 1),
              ),
            ),
            isSelected
                ? SvgPicture.asset(
                    'assets/icons/success.svg',
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      Color.fromRGBO(82, 51, 255, 1),
                      BlendMode.srcIn,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
