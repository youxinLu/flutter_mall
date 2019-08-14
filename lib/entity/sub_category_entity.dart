import 'package:json_annotation/json_annotation.dart';

part 'sub_category_entity.g.dart';

class SubCategoryListEntity {
  List<SubCategoryEntity> subCategoryEntitys;

  SubCategoryListEntity(this.subCategoryEntitys);

  factory SubCategoryListEntity.fromJson(List<dynamic> parseJson) {
    List<SubCategoryEntity> productEntitys;
    productEntitys =
        parseJson.map((i) => SubCategoryEntity.fromJson(i)).toList();
    return SubCategoryListEntity(productEntitys);
  }
}

@JsonSerializable()
class SubCategoryEntity extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'keywords')
  String keywords;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'pid')
  int pid;

  @JsonKey(name: 'iconUrl')
  String iconUrl;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'level')
  String level;

  @JsonKey(name: 'sortOrder')
  int sortOrder;

  @JsonKey(name: 'addTime')
  String addTime;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'deleted')
  bool deleted;

  SubCategoryEntity(
    this.id,
    this.name,
    this.keywords,
    this.desc,
    this.pid,
    this.iconUrl,
    this.picUrl,
    this.level,
    this.sortOrder,
    this.addTime,
    this.updateTime,
    this.deleted,
  );

  factory SubCategoryEntity.fromJson(Map<String, dynamic> srcJson) =>
      _$SubCategoryEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SubCategoryEntityToJson(this);
}
