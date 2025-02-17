import 'package:flutter/material.dart';

class RecipeModel with ChangeNotifier {
  int _activeScreen = 0;

  int get activeScreen => _activeScreen;

  void changeActiveScreen(int val) {
    if (_activeScreen == val) return;
    
    _activeScreen = val;
    notifyListeners();
  }
}
