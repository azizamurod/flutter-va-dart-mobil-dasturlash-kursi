import 'package:flutter/material.dart';

import '/data/hive/hive_db.dart';

class SettingsProvider with ChangeNotifier {
  String _currency = HiveDb.currency;
  String _language = HiveDb.language;

  String get currency => _currency;
  String get language => _language;

  void changeLanguage(String val) {
    if (_language == val) return;

    HiveDb.setLanguage(val);
    _language = val;
    notifyListeners();
  }

  void changeCurrency(String val) {
    if (_currency == val) return;

    HiveDb.setCurrency(val);
    _currency = val;
    notifyListeners();
  }

  String getCurrencySign() {
    if (_currency == 'USD') {
      return '\$';
    } else if (_currency == 'SOM') {
      return 'UZS';
    } else {
      return '₽';
    }
  }

  bool showCurrencySignBeforeAmount() {
    if (_currency == 'SOM') {
      return false;
    } else {
      return true;
    }
  }
}
