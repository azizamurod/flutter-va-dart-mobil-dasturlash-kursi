import 'package:flutter/material.dart';

import '/data/drift/drift_db.dart';

import '/utils/functions/show_error_alert.dart';

import '/data/hive/hive_db.dart';

class UserAndNavigationManagementProvider with ChangeNotifier {
  final PageController _onboardingPageController = PageController();
  final TextEditingController _nameController = TextEditingController();

  PageController get onboardingPageController => _onboardingPageController;
  TextEditingController get nameController => _nameController;

  int? _pin;
  int? _retypePin;
  bool _createPin = true;
  int _activeScreen = 0;
  bool _isPlusTapped = false;

  int? get pin => _pin;
  int? get retypePin => _retypePin;
  bool get createPin => _createPin;
  int get activeScreen => _activeScreen;
  bool get isPlusTapped => _isPlusTapped;

  final String _username = HiveDb.username;
  String get username => _username;

  /// main
  void changeActiveScreen(int val) {
    if (_isPlusTapped) onTapPlusButton();
    if (val == _activeScreen) return;

    _activeScreen = val;
    notifyListeners();
  }

  void onTapPlusButton() {
    _isPlusTapped = !_isPlusTapped;
    notifyListeners();
  }

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
      showErrorAlert(context, 'Please enter your name !');
      notifyListeners();
    } else {
      HiveDb.setUsername(nameController.text);
      HiveDb.setHasSignedUp(true);
      HiveDb.setsignedUpDate(DateTime.now());
      Navigator.popAndPushNamed(context, '/create-pin');
    }
  }

  /// pin
  void onTapPinNumber({
    required int num,
    required BuildContext context,
    bool? security,
  }) async {
    if (security == true) {
      if ((_pin ?? 0) > 999) return;

      _pin = (_pin ?? 0) * 10 + num;
      if ((_pin ?? 0) > 999) {
        if (HiveDb.pinCode == _pin) {
          final List accounts = await DriftDb().getAllAccounts();
          if (accounts.isEmpty) {
            Navigator.popAndPushNamed(context, '/set-up-accounts');
          } else {
            Navigator.popAndPushNamed(context, '/main');
          }
        } else {
          showErrorAlert(
            context,
            'Incorrect PIN ! Please enter PIN again !',
          );
          _pin = null;
        }
      }
    } else {
      if (_createPin) {
        _pin = (_pin ?? 0) * 10 + num;
        if ((_pin ?? 0) > 999) return;

        if ((_pin ?? 0) > 999) _createPin = false;
      } else {
        _retypePin = (_retypePin ?? 0) * 10 + num;
        if ((_retypePin ?? 0) > 999) return;

        if ((_retypePin ?? 0) > 999) {
          if (_retypePin == _pin) {
            HiveDb.setpinCode(_pin);
            Navigator.popAndPushNamed(context, '/set-up-accounts');
          } else {
            showErrorAlert(
              context,
              'Previous PIN and this PIN do not match ! Please create PIN again !',
            );
            _createPin = true;
            _pin = null;
            _retypePin = null;
          }
        }
      }
    }

    notifyListeners();
  }

  void removePinNumber() {
    if (_createPin) {
      if ((_pin ?? 0) < 10) {
        _pin = null;
      } else {
        _pin = (_pin ?? 0) ~/ 10;
      }
    } else {
      if ((_retypePin ?? 0) < 10) {
        _retypePin = null;
      } else {
        _retypePin = (_retypePin ?? 0) ~/ 10;
      }
    }

    notifyListeners();
  }
}
