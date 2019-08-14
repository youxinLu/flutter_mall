// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_buy_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupBuyEntity _$GroupBuyEntityFromJson(Map<String, dynamic> json) {
  return GroupBuyEntity(
      json['id'] as int,
      json['name'] as String,
      json['brief'] as String,
      json['picUrl'] as String,
      (json['counterPrice'] as num)?.toDouble(),
      (json['retailPrice'] as num)?.toDouble(),
      (json['grouponPrice'] as num)?.toDouble(),
      json['grouponDiscount'] as int,
      json['grouponMember'] as int);
}

Map<String, dynamic> _$GroupBuyEntityToJson(GroupBuyEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brief': instance.brief,
      'picUrl': instance.picUrl,
      'counterPrice': instance.counterPrice,
      'retailPrice': instance.retailPrice,
      'grouponPrice': instance.grouponPrice,
      'grouponDiscount': instance.grouponDiscount,
      'grouponMember': instance.grouponMember
    };
