import 'package:json_annotation/json_annotation.dart';

part 'category_title_entity.g.dart';


@JsonSerializable()
class CategoryTitleEntity extends Object {

  @JsonKey(name: 'currentCategory')
  CurrentCategory currentCategory;

  @JsonKey(name: 'brotherCategory')
  List<BrotherCategory> brotherCategory;

  @JsonKey(name: 'parentCategory')
  ParentCategory parentCategory;

  CategoryTitleEntity(this.currentCategory,this.brotherCategory,this.parentCategory,);

  factory CategoryTitleEntity.fromJson(Map<String, dynamic> srcJson) => _$CategoryTitleEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryTitleEntityToJson(this);

}


@JsonSerializable()
class CurrentCategory extends Object {

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

  CurrentCategory(this.id,this.name,this.keywords,this.desc,this.pid,this.iconUrl,this.picUrl,this.level,this.sortOrder,this.addTime,this.updateTime,this.deleted,);

  factory CurrentCategory.fromJson(Map<String, dynamic> srcJson) => _$CurrentCategoryFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CurrentCategoryToJson(this);

}


@JsonSerializable()
class BrotherCategory extends Object {

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

  BrotherCategory(this.id,this.name,this.keywords,this.desc,this.pid,this.iconUrl,this.picUrl,this.level,this.sortOrder,this.addTime,this.updateTime,this.deleted,);

  factory BrotherCategory.fromJson(Map<String, dynamic> srcJson) => _$BrotherCategoryFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BrotherCategoryToJson(this);

}


@JsonSerializable()
class ParentCategory extends Object {

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

  ParentCategory(this.id,this.name,this.keywords,this.desc,this.pid,this.iconUrl,this.picUrl,this.level,this.sortOrder,this.addTime,this.updateTime,this.deleted,);

  factory ParentCategory.fromJson(Map<String, dynamic> srcJson) => _$ParentCategoryFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ParentCategoryToJson(this);

}


