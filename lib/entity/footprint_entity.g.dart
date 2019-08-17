// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'footprint_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FootprintEntity _$FootprintEntityFromJson(Map<String, dynamic> json) {
  return FootprintEntity(
      json['total'] as int,
      json['pages'] as int,
      json['limit'] as int,
      json['page'] as int,
      (json['listData'] as List)
          ?.map((e) =>
              e == null ? null : Footprint.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$FootprintEntityToJson(FootprintEntity instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pages': instance.pages,
      'limit': instance.limit,
      'page': instance.page,
      'listData': instance.listData
    };

Footprint _$FootprintFromJson(Map<String, dynamic> json) {
  return Footprint(
      json['brief'] as String,
      json['picUrl'] as String,
      json['addTime'] as String,
      json['goodsId'] as int,
      json['name'] as String,
      json['id'] as int,
      (json['retailPrice'] as num)?.toDouble());
}

Map<String, dynamic> _$FootprintToJson(Footprint instance) => <String, dynamic>{
      'brief': instance.brief,
      'picUrl': instance.picUrl,
      'addTime': instance.addTime,
      'goodsId': instance.goodsId,
      'name': instance.name,
      'id': instance.id,
      'retailPrice': instance.retailPrice
    };
