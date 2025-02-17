import 'package:flutter/material.dart';

import '/data/drift/drift_db.dart';

import '/utils/functions/show_error_alert.dart';


class AccountsProvider with ChangeNotifier {
  final DriftDb driftDb = DriftDb();

  TextEditingController _accountBalanceController =
      TextEditingController(text: '0');
  TextEditingController _accountNameController = TextEditingController();

  TextEditingController get accountBalanceController =>
      _accountBalanceController;
  TextEditingController get accountNameController => _accountNameController;

  void createAccount(
    BuildContext context, {
    bool isInitialScreen = false,
  }) async {
    if (_accountNameController.text.isEmpty) {
      showErrorAlert(context, 'Please enter account name !');
    } else {
      await driftDb.createAccount(
        name: _accountNameController.text,
        initialBalance: double.tryParse(_accountBalanceController.text),
      );
      Navigator.pop(context);
      if (isInitialScreen) {
        Navigator.popAndPushNamed(context, '/all-done');
      }
      resetCreateAccountScreen();
    }
  }

  void resetCreateAccountScreen() {
    _accountBalanceController = TextEditingController(text: '0');
    _accountNameController = TextEditingController();
  }
}
