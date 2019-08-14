// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoryEntity _$SubCategoryEntityFromJson(Map<String, dynamic> json) {
  return SubCategoryEntity(
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

Map<String, dynamic> _$SubCategoryEntityToJson(SubCategoryEntity instance) =>
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
