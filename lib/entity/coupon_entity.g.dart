// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponEntity _$CouponEntityFromJson(Map<String, dynamic> json) {
  return CouponEntity(
      json['id'] as int,
      json['name'] as String,
      json['desc'] as String,
      json['tag'] as String,
      (json['discount'] as num)?.toDouble(),
      (json['min'] as num)?.toDouble(),
      json['days'] as int);
}

Map<String, dynamic> _$CouponEntityToJson(CouponEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desc': instance.desc,
      'tag': instance.tag,
      'discount': instance.discount,
      'min': instance.min,
      'days': instance.days
    };
