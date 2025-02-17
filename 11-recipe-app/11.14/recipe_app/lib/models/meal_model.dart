class MealModel {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  MealModel({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  MealModel.fromJson(Map<String, dynamic> json) {
    strMeal = json['strMeal'];
    strMealThumb = json['strMealThumb'];
    idMeal = json['idMeal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['strMeal'] = strMeal;
    data['strMealThumb'] = strMealThumb;
    data['idMeal'] = idMeal;
    return data;
  }
}
