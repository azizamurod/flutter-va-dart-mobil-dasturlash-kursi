import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/models/meal_model.dart';
import '/models/result_model.dart';
import '/models/category_model.dart';
import '/models/ingredient_model.dart';

class RecipeModel with ChangeNotifier {
  int _activeScreen = 0;
  bool _isInitialDataLoading = true;
  bool _isInitialDataError = false;

  List<IngredientModel> _ingredients = [];
  List<CategoryModel> _categories = [];
  String? _activeIngredient;
  String? _activeCategory;
  ResultModel<MealModel> _mealsForIngredient = ResultModel(data: []);
  ResultModel<MealModel> _mealsForCategory = ResultModel(data: []);

  int get activeScreen => _activeScreen;
  bool get isInitialDataLoading => _isInitialDataLoading;
  bool get isInitialDataError => _isInitialDataError;

  List<IngredientModel> get ingredients => _ingredients;
  List<CategoryModel> get categories => _categories;
  String? get activeIngredient => _activeIngredient;
  String? get activeCategory => _activeCategory;
  ResultModel<MealModel> get mealsForIngredient => _mealsForIngredient;
  ResultModel<MealModel> get mealsForCategory => _mealsForCategory;

  void changeActiveScreen(int val) {
    if (_activeScreen == val) return;

    _activeScreen = val;
    notifyListeners();
  }

  void selectActiveIngredient(String? val) {
    if (val == _activeIngredient) return;

    _activeIngredient = val;
    getMealsForIngredient();
    notifyListeners();
  }

  void selectActiveCategory(String? val) {
    if (val == _activeCategory) return;

    _activeCategory = val;
    getMealsForCategory();
    notifyListeners();
  }

  Future<void> getInitialData() async {
    await getIngredients();
    await getCategories();
    _isInitialDataLoading = false;
    notifyListeners();
  }

  Future<void> getIngredients() async {
    try {
      final response = await http.get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/list.php?i=list"),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var el in data["meals"]) {
          _ingredients.add(IngredientModel.fromJson(el));
        }
        _activeIngredient = _ingredients.first.strIngredient;

        getMealsForIngredient();
      } else {
        _isInitialDataLoading = false;
        _isInitialDataError = true;
        notifyListeners();
      }
    } catch (e) {
      _isInitialDataLoading = false;
      _isInitialDataError = true;
      notifyListeners();
    }
  }

  Future<void> getCategories() async {
    try {
      final response = await http.get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/list.php?c=list"),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var el in data["meals"]) {
          _categories.add(CategoryModel.fromJson(el));
        }
        _activeCategory = _categories.first.strCategory;

        getMealsForCategory();
      } else {
        _isInitialDataLoading = false;
        _isInitialDataError = true;
        notifyListeners();
      }
    } catch (e) {
      _isInitialDataLoading = false;
      _isInitialDataError = true;
      notifyListeners();
    }
  }

  Future<void> getMealsForIngredient() async {
    try {
      _mealsForIngredient = ResultModel(data: []);
      notifyListeners();

      final response = await http.get(
        Uri.parse(
            "https://www.themealdb.com/api/json/v1/1/filter.php?i=$_activeIngredient"),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var el in data["meals"]) {
          _mealsForIngredient.data.add(MealModel.fromJson(el));
        }
        _mealsForIngredient.hasLoaded = true;
        notifyListeners();
      } else {
        _mealsForIngredient.hasLoaded = true;
        _mealsForIngredient.hasErrored = true;
        notifyListeners();
      }
    } catch (e) {
      _mealsForIngredient.hasLoaded = true;
      _mealsForIngredient.hasErrored = true;
      notifyListeners();
    }
  }

  Future<void> getMealsForCategory() async {
    try {
      _mealsForCategory = ResultModel(data: []);
      notifyListeners();

      final response = await http.get(
        Uri.parse(
            "https://www.themealdb.com/api/json/v1/1/filter.php?c=$_activeCategory"),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var el in data["meals"]) {
          _mealsForCategory.data.add(MealModel.fromJson(el));
        }
        _mealsForCategory.hasLoaded = true;
        notifyListeners();
      } else {
        _mealsForCategory.hasLoaded = true;
        _mealsForCategory.hasErrored = true;
        notifyListeners();
      }
    } catch (e) {
      _mealsForCategory.hasLoaded = true;
      _mealsForCategory.hasErrored = true;
      notifyListeners();
    }
  }
}
