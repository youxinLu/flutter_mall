// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerEntity _$BannerEntityFromJson(Map<String, dynamic> json) {
  return BannerEntity(
      json['id'] as int,
      json['name'] as String,
      json['link'] as String,
      json['url'] as String,
      json['position'] as int,
      json['content'] as String,
      json['enabled'] as bool,
      json['addTime'] as String,
      json['updateTime'] as String,
      json['deleted'] as bool);
}

Map<String, dynamic> _$BannerEntityToJson(BannerEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'link': instance.link,
      'url': instance.url,
      'position': instance.position,
      'content': instance.content,
      'enabled': instance.enabled,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted
    };
