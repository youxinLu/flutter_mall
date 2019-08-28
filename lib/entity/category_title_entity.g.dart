// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_title_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryTitleEntity _$CategoryTitleEntityFromJson(Map<String, dynamic> json) {
  return CategoryTitleEntity(
      json['currentCategory'] == null
          ? null
          : CurrentCategory.fromJson(
              json['currentCategory'] as Map<String, dynamic>),
      (json['brotherCategory'] as List)
          ?.map((e) => e == null
              ? null
              : BrotherCategory.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['parentCategory'] == null
          ? null
          : ParentCategory.fromJson(
              json['parentCategory'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CategoryTitleEntityToJson(
        CategoryTitleEntity instance) =>
    <String, dynamic>{
      'currentCategory': instance.currentCategory,
      'brotherCategory': instance.brotherCategory,
      'parentCategory': instance.parentCategory
    };

CurrentCategory _$CurrentCategoryFromJson(Map<String, dynamic> json) {
  return CurrentCategory(
      json['id'] as int,
      json['name'] as String,
      json['keywords'] as String,
      json['desc'] as String,
      json['pid'] as int,
      json['iconUrl'] as String,
      json['picUrl'] as String,
      json['level'] as String,
      json['sortOrder'] as int,
      json['addTime'] as String,
      json['updateTime'] as String,
      json['deleted'] as bool);
}

Map<String, dynamic> _$CurrentCategoryToJson(CurrentCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'keywords': instance.keywords,
      'desc': instance.desc,
      'pid': instance.pid,
      'iconUrl': instance.iconUrl,
      'picUrl': instance.picUrl,
      'level': instance.level,
      'sortOrder': instance.sortOrder,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted
    };

BrotherCategory _$BrotherCategoryFromJson(Map<String, dynamic> json) {
  return BrotherCategory(
      json['id'] as int,
      json['name'] as String,
      json['keywords'] as String,
      json['desc'] as String,
      json['pid'] as int,
      json['iconUrl'] as String,
      json['picUrl'] as String,
      json['level'] as String,
      json['sortOrder'] as int,
      json['addTime'] as String,
      json['updateTime'] as String,
      json['deleted'] as bool);
}

Map<String, dynamic> _$BrotherCategoryToJson(BrotherCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'keywords': instance.keywords,
      'desc': instance.desc,
      'pid': instance.pid,
      'iconUrl': instance.iconUrl,
      'picUrl': instance.picUrl,
      'level': instance.level,
      'sortOrder': instance.sortOrder,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted
    };

ParentCategory _$ParentCategoryFromJson(Map<String, dynamic> json) {
  return ParentCategory(
      json['id'] as int,
      json['name'] as String,
      json['keywords'] as String,
      json['desc'] as String,
      json['pid'] as int,
      json['iconUrl'] as String,
      json['picUrl'] as String,
      json['level'] as String,
      json['sortOrder'] as int,
      json['addTime'] as String,
      json['updateTime'] as String,
      json['deleted'] as bool);
}

Map<String, dynamic> _$ParentCategoryToJson(ParentCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'keywords': instance.keywords,
      'desc': instance.desc,
      'pid': instance.pid,
      'iconUrl': instance.iconUrl,
      'picUrl': instance.picUrl,
      'level': instance.level,
      'sortOrder': instance.sortOrder,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted
    };
