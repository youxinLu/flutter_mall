// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponListEntity _$CouponListEntityFromJson(Map<String, dynamic> json) {
  return CouponListEntity(
      json['total'] as int,
      json['pages'] as int,
      json['limit'] as int,
      json['page'] as int,
      (json['listData'] as List)
          ?.map((e) =>
              e == null ? null : Coupon.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CouponListEntityToJson(CouponListEntity instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pages': instance.pages,
      'limit': instance.limit,
      'page': instance.page,
      'listData': instance.listData
    };

Coupon _$CouponFromJson(Map<String, dynamic> json) {
  return Coupon(
      json['id'] as int,
      json['name'] as String,
      json['desc'] as String,
      json['tag'] as String,
      json['min'] as String,
      json['discount'] as String,
      json['startTime'] as String,
      json['endTime'] as String);
}

Map<String, dynamic> _$CouponToJson(Coupon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desc': instance.desc,
      'tag': instance.tag,
      'min': instance.min,
      'discount': instance.discount,
      'startTime': instance.startTime,
      'endTime': instance.endTime
    };
