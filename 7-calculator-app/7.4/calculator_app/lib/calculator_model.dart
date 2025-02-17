import 'package:flutter/material.dart';

class Calculator with ChangeNotifier {
  double _previousNumber = 0;
  double _number = 123456789;
  String _operation = '';
  bool _isDotTapped = false;

  String get number {
    String numberStr = _number.toString();

    /// 1000 => 1,000
    /// 1000000 => 1,000,000

    if (_number >= 1000) {
      numberStr = numberStr.replaceAllMapped(
          RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => ',');
    }

    /// isDotTapped == false 0.0 => 0, 7.0 => 7
    if (!_isDotTapped && numberStr.contains('.') && numberStr.endsWith('.0')) {
      numberStr = numberStr.substring(0, numberStr.indexOf('.'));
    }

    /// isDotTapped = true 0.0 => 0.  , 7.0 => 7.
    /// isDotTapped = true 0.4 => 0.4 ,  7.5 => 7.5
    if (_isDotTapped && numberStr[numberStr.length - 1] == 0.toString()) {
      numberStr = numberStr.substring(0, numberStr.length - 1);
    }

    return numberStr;
  }

  void clear() {
    _previousNumber = 0;
    _number = 0;
    _operation = '';
    _isDotTapped = false;

    notifyListeners();
  }

  void onSignChange() {
    _number = -_number;
    notifyListeners();
  }

  void onTapPercent() {
    _number = _number / 100;
    notifyListeners();
  }
}
