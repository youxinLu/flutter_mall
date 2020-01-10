// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_selection_recommed_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectSelectionRecommedEntity _$ProjectSelectionRecommedEntityFromJson(
    Map<String, dynamic> json) {
  return ProjectSelectionRecommedEntity(
      json['total'] as int,
      json['pages'] as int,
      (json['list'] as List)
          ?.map((e) =>
              e == null ? null : Recommed.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['limit'] as int,
      json['page'] as int);
}

Map<String, dynamic> _$ProjectSelectionRecommedEntityToJson(
        ProjectSelectionRecommedEntity instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pages': instance.pages,
      'list': instance.recommed,
      'limit': instance.limit,
      'page': instance.page
    };

Recommed _$RecommedFromJson(Map<String, dynamic> json) {
  return Recommed(
      json['id'] as int,
      json['title'] as String,
      json['subtitle'] as String,
      (json['price'] as num)?.toDouble(),
      json['readCount'] as String,
      json['picUrl'] as String,
      json['sortOrder'] as int,
      json['goods'] as List,
      json['addTime'] as String,
      json['updateTime'] as String,
      json['deleted'] as bool,
      json['content'] as String);
}

Map<String, dynamic> _$RecommedToJson(Recommed instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'price': instance.price,
      'readCount': instance.readCount,
      'picUrl': instance.picUrl,
      'sortOrder': instance.sortOrder,
      'goods': instance.goods,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted,
      'content': instance.content
    };
