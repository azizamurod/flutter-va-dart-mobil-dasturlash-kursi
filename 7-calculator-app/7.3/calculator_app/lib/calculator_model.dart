import 'package:flutter/material.dart';

class Calculator with ChangeNotifier {
  double _previousNumber = 0;
  double _number = 123456789;
  String _operation = '';
  bool _isDotTapped = false;

  String get number => _number.toString();

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
