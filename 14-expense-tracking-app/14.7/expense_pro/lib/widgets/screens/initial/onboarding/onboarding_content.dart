import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'three_dots.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.activeIndex,
  });

  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Center(
        child: Column(
          children: [
            SvgPicture.asset(
              activeIndex == 1
                  ? 'assets/images/onboarding/illustration1.svg'
                  : (activeIndex == 2
                      ? 'assets/images/onboarding/illustration2.svg'
                      : 'assets/images/onboarding/illustration3.svg'),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  Text(
                    activeIndex == 1
                        ? 'Gain total control of your money'
                        : (activeIndex == 2
                            ? 'Know where your money goes'
                            : 'Planning ahead'),
                    style: GoogleFonts.inter(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(33, 35, 37, 1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 17),
                  Text(
                    activeIndex == 1
                        ? 'Become your own money manager and make every cent count'
                        : (activeIndex == 2
                            ? 'Track your transaction easily, with categories and financial report'
                            : 'Setup your budget for each category so you in control'),
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(145, 145, 159, 1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 31),
            ThreeDots(activeIndex: activeIndex),
          ],
        ),
      ),
    );
  }
}
