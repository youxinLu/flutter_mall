// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_selection_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectSelectionDetailEntity _$ProjectSelectionDetailEntityFromJson(
    Map<String, dynamic> json) {
  return ProjectSelectionDetailEntity(
      json['topic'] == null
          ? null
          : Topic.fromJson(json['topic'] as Map<String, dynamic>),
      (json['goods'] as List)
          ?.map((e) =>
              e == null ? null : Goods.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ProjectSelectionDetailEntityToJson(
        ProjectSelectionDetailEntity instance) =>
    <String, dynamic>{'topic': instance.topic, 'goods': instance.goods};

Topic _$TopicFromJson(Map<String, dynamic> json) {
  return Topic(
      json['id'] as int,
      json['title'] as String,
      json['subtitle'] as String,
      (json['price'] as num)?.toDouble(),
      json['readCount'] as String,
      json['picUrl'] as String,
      json['sortOrder'] as int,
      (json['goods'] as List)?.map((e) => e as int)?.toList(),
      json['addTime'] as String,
      json['updateTime'] as String,
      json['deleted'] as bool,
      json['content'] as String);
}

Map<String, dynamic> _$TopicToJson(Topic instance) => <String, dynamic>{
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

Goods _$GoodsFromJson(Map<String, dynamic> json) {
  return Goods(
      json['id'] as int,
      json['name'] as String,
      json['brief'] as String,
      json['picUrl'] as String,
      json['isNew'] as bool,
      json['isHot'] as bool,
      (json['counterPrice'] as num)?.toDouble(),
      (json['retailPrice'] as num)?.toDouble());
}

Map<String, dynamic> _$GoodsToJson(Goods instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brief': instance.brief,
      'picUrl': instance.picUrl,
      'isNew': instance.isNew,
      'isHot': instance.isHot,
      'counterPrice': instance.counterPrice,
      'retailPrice': instance.retailPrice
    };
