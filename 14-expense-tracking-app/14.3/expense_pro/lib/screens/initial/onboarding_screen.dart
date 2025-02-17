import 'package:flutter/material.dart';

import '/widgets/buttons/custom_button.dart';
import '/widgets/initial/onboarding/onboarding_content.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const OnboardingContent(activeIndex: 1),
            CustomButton(
              text: 'Continue',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
