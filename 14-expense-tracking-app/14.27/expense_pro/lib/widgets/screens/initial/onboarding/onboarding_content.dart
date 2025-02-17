import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              activeIndex == 0
                  ? 'assets/images/onboarding/illustration1.svg'
                  : (activeIndex == 1
                      ? 'assets/images/onboarding/illustration2.svg'
                      : 'assets/images/onboarding/illustration3.svg'),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  Text(
                    activeIndex == 0
                        ? AppLocalizations.of(context)!.onboarding_title_1
                        : (activeIndex == 1
                            ? AppLocalizations.of(context)!.onboarding_title_2
                            : AppLocalizations.of(context)!.onboarding_title_3),
                    style: GoogleFonts.inter(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(33, 35, 37, 1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 17),
                  Text(
                    activeIndex == 0
                        ? AppLocalizations.of(context)!.onboarding_description_1
                        : (activeIndex == 1
                            ? AppLocalizations.of(context)!.onboarding_description_2
                            : AppLocalizations.of(context)!.onboarding_description_3),
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
