import 'package:json_annotation/json_annotation.dart';

part 'category_entity.g.dart';

class CategoryListEntity {
  List<CategoryEntity> categoryEntityList;

  CategoryListEntity(this.categoryEntityList);

  factory CategoryListEntity.fromJson(List<dynamic> parseJson) {
    List<CategoryEntity> categoryEntityList;
    categoryEntityList =
        parseJson.map((i) => CategoryEntity.fromJson(i)).toList();
    return CategoryListEntity(categoryEntityList);
  }
}

@JsonSerializable()
class CategoryEntity extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'iconUrl')
  String iconUrl;

  CategoryEntity(
    this.id,
    this.name,
    this.iconUrl,
  );

  factory CategoryEntity.fromJson(Map<String, dynamic> srcJson) =>
      _$CategoryEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryEntityToJson(this);
}
