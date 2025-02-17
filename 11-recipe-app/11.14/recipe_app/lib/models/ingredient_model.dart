class IngredientModel {
  String? idIngredient;
  String? strIngredient;
  String? strDescription;
  String? strType;

  IngredientModel({
    this.idIngredient,
    this.strIngredient,
    this.strDescription,
    this.strType,
  });

  IngredientModel.fromJson(Map<String, dynamic> json) {
    idIngredient = json['idIngredient'];
    strIngredient = json['strIngredient'];
    strDescription = json['strDescription'];
    strType = json['strType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idIngredient'] = idIngredient;
    data['strIngredient'] = strIngredient;
    data['strDescription'] = strDescription;
    data['strType'] = strType;
    return data;
  }
}
