// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductEntity _$ProductEntityFromJson(Map<String, dynamic> json) {
  return ProductEntity(
      json['id'] as int,
      json['name'] as String,
      json['brief'] as String,
      json['picUrl'] as String,
      json['isNew'] as bool,
      json['isHot'] as bool,
      (json['counterPrice'] as num)?.toDouble(),
      (json['retailPrice'] as num)?.toDouble());
}

Map<String, dynamic> _$ProductEntityToJson(ProductEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brief': instance.brief,
      'picUrl': instance.picUrl,
      'isNew': instance.isNew,
      'isHot': instance.isHot,
      'counterPrice': instance.counterPrice,
      'retailPrice': instance.retailPrice
    };
