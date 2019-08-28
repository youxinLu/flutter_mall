// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandDetailEntity _$BrandDetailEntityFromJson(Map<String, dynamic> json) {
  return BrandDetailEntity(
      json['id'] as int,
      json['name'] as String,
      json['desc'] as String,
      json['picUrl'] as String,
      (json['floorPrice'] as num)?.toDouble());
}

Map<String, dynamic> _$BrandDetailEntityToJson(BrandDetailEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desc': instance.desc,
      'picUrl': instance.picUrl,
      'floorPrice': instance.floorPrice
    };
