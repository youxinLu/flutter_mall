import 'package:mall/model/category_entity.dart';

class CategoryTitleEntity {
  CategoryEntity currentCategory;
  List<CategoryEntity> brotherCategory;
  CategoryEntity parentCategory;

  CategoryTitleEntity(
      {this.currentCategory, this.brotherCategory, this.parentCategory});

  CategoryTitleEntity.fromJson(Map<String, dynamic> json) {
    currentCategory = json['currentCategory'] != null
        ? new CategoryEntity.fromJson(json['currentCategory'])
        : null;
    if (json['brotherCategory'] != null) {
      brotherCategory = new List<CategoryEntity>();
      (json['brotherCategory'] as List).forEach((v) {
        brotherCategory.add(new CategoryEntity.fromJson(v));
      });
    }
    parentCategory = json['parentCategory'] != null
        ? new CategoryEntity.fromJson(json['parentCategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currentCategory != null) {
      data['currentCategory'] = this.currentCategory.toJson();
    }
    if (this.brotherCategory != null) {
      data['brotherCategory'] =
          this.brotherCategory.map((v) => v.toJson()).toList();
    }
    if (this.parentCategory != null) {
      data['parentCategory'] = this.parentCategory.toJson();
    }
    return data;
  }
}

