// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collect_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectEntity _$CollectEntityFromJson(Map<String, dynamic> json) {
  return CollectEntity(
      json['total'] as int,
      json['pages'] as int,
      (json['listData'] as List)
          ?.map((e) =>
              e == null ? null : Collect.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['limit'] as int,
      json['page'] as int);
}

Map<String, dynamic> _$CollectEntityToJson(CollectEntity instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pages': instance.pages,
      'listData': instance.listData,
      'limit': instance.limit,
      'page': instance.page
    };

Collect _$CollectFromJson(Map<String, dynamic> json) {
  return Collect(
      json['id'] as int,
      json['type'] as int,
      json['bried'] as String,
      json['picUrl'] as String,
      json['valueId'] as int,
      json['name'] as String,
      (json['retailPrice'] as num)?.toDouble());
}

Map<String, dynamic> _$CollectToJson(Collect instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'bried': instance.bried,
      'picUrl': instance.picUrl,
      'valueId': instance.valueId,
      'name': instance.name,
      'retailPrice': instance.retailPrice
    };
