import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/.providers.dart';

import '/widgets/buttons/custom_button.dart';
import '/widgets/screens/initial/onboarding/onboarding_content.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<UserAndNavigationManagementProvider>(
          builder: (
            context,
            userAndNavigationManagementProvider,
            child,
          ) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PageView(
                    controller: userAndNavigationManagementProvider
                        .onboardingPageController,
                    children: const [
                      OnboardingContent(activeIndex: 0),
                      OnboardingContent(activeIndex: 1),
                      OnboardingContent(activeIndex: 2),
                    ],
                  ),
                ),
                CustomButton(
                  text: 'Continue',
                  margin:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  onTap: () => userAndNavigationManagementProvider
                      .onTapOnboardingContinueButton(
                    context,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
