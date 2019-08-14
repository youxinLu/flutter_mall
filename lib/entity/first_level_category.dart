import 'package:json_annotation/json_annotation.dart';

part 'first_level_category.g.dart';

class FirstLevelListCategory {
  List<FirstLevelCategory> firstLevelCategory;

  FirstLevelListCategory(this.firstLevelCategory);

  factory FirstLevelListCategory.fromJson(List<dynamic> parseJson) {
    List<FirstLevelCategory> firstLevelCategorys;
    firstLevelCategorys =
        parseJson.map((i) => FirstLevelCategory.fromJson(i)).toList();
    return FirstLevelListCategory(firstLevelCategorys);
  }
}

@JsonSerializable()
class FirstLevelCategory extends Object {
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

  FirstLevelCategory(
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

  factory FirstLevelCategory.fromJson(Map<String, dynamic> srcJson) =>
      _$FirstLevelCategoryFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FirstLevelCategoryToJson(this);
}
