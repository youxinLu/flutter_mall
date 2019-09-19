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
      (json['list'] as List)
          ?.map((e) =>
              e == null ? null : ListData.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$FootprintEntityToJson(FootprintEntity instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pages': instance.pages,
      'limit': instance.limit,
      'page': instance.page,
      'list': instance.list
    };

ListData _$ListDataFromJson(Map<String, dynamic> json) {
  return ListData(
      json['brief'] as String,
      json['picUrl'] as String,
      json['addTime'] as String,
      json['goodsId'] as int,
      json['name'] as String,
      json['id'] as int,
      (json['retailPrice'] as num)?.toDouble());
}

Map<String, dynamic> _$ListDataToJson(ListData instance) => <String, dynamic>{
      'brief': instance.brief,
      'picUrl': instance.picUrl,
      'addTime': instance.addTime,
      'goodsId': instance.goodsId,
      'name': instance.name,
      'id': instance.id,
      'retailPrice': instance.retailPrice
    };
