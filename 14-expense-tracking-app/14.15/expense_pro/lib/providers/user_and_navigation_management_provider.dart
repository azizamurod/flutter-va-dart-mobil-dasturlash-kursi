import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

import '/data/hive/hive_db.dart';

class UserAndNavigationManagementProvider with ChangeNotifier {
  final PageController _onboardingPageController = PageController();
  final TextEditingController _nameController = TextEditingController();

  PageController get onboardingPageController => _onboardingPageController;
  TextEditingController get nameController => _nameController;

  /// splash

  void navigateAfterSplashScreen(BuildContext context) {
    if (!HiveDb.hasSignedUp) {
      Navigator.popAndPushNamed(context, '/onboarding');
    } else {
      if (HiveDb.pinCode == null) {
        Navigator.popAndPushNamed(context, '/create-pin');
      } else {
        Navigator.popAndPushNamed(context, '/security-pin');
      }
    }
  }

  /// onboarding

  void onTapOnboardingContinueButton(BuildContext context) {
    if (_onboardingPageController.page?.toInt() == 2) {
      Navigator.pushNamed(context, '/sign-up');
    } else {
      _onboardingPageController.animateToPage(
        ((_onboardingPageController.page?.toInt() ?? 0) + 1),
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
      notifyListeners();
    }
  }

  /// sign up

  void signUp(BuildContext context) {
    if (nameController.text.isEmpty) {
      AnimatedSnackBar.material(
        'Please enter your name !',
        type: AnimatedSnackBarType.error,
      ).show(context);
      notifyListeners();
    } else {
      HiveDb.setUsername(nameController.text);
      HiveDb.setHasSignedUp(true);
      HiveDb.setsignedUpDate(DateTime.now());
      Navigator.popAndPushNamed(context, '/create-pin');
    }
  }
}
