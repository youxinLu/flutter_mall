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
      (json['list'] as List)
          ?.map((e) =>
              e == null ? null : ListData.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CouponListEntityToJson(CouponListEntity instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pages': instance.pages,
      'limit': instance.limit,
      'page': instance.page,
      'list': instance.list
    };

ListData _$ListDataFromJson(Map<String, dynamic> json) {
  return ListData(
      json['id'] as int,
      json['name'] as String,
      json['desc'] as String,
      json['tag'] as String,
      json['min'] as String,
      json['discount'] as String,
      json['startTime'] as String,
      json['endTime'] as String);
}

Map<String, dynamic> _$ListDataToJson(ListData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desc': instance.desc,
      'tag': instance.tag,
      'min': instance.min,
      'discount': instance.discount,
      'startTime': instance.startTime,
      'endTime': instance.endTime
    };
