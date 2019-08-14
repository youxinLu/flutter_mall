// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryEntity _$CategoryEntityFromJson(Map<String, dynamic> json) {
  return CategoryEntity(
      json['id'] as int, json['name'] as String, json['iconUrl'] as String);
}

Map<String, dynamic> _$CategoryEntityToJson(CategoryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconUrl': instance.iconUrl
    };
