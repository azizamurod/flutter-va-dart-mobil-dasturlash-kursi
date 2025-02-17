class CategoryModel {
  String? strCategory;

  CategoryModel({this.strCategory});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    strCategory = json['strCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['strCategory'] = strCategory;
    return data;
  }
}
