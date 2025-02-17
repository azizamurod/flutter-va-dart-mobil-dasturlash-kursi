class MealModel {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;
  String? strArea;

  MealModel({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
    this.strArea,
  });

  MealModel.fromJson(Map<String, dynamic> json) {
    strMeal = json['strMeal'];
    strMealThumb = json['strMealThumb'];
    idMeal = json['idMeal'];
    strArea = json['strArea'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['strMeal'] = strMeal;
    data['strMealThumb'] = strMealThumb;
    data['idMeal'] = idMeal;
    data['strArea'] = strArea;
    return data;
  }
}
