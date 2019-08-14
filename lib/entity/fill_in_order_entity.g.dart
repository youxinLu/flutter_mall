// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fill_in_order_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FillInOrderEntity _$FillInOrderEntityFromJson(Map<String, dynamic> json) {
  return FillInOrderEntity(
      json['grouponRulesId'] as int,
      (json['actualPrice'] as num)?.toDouble(),
      (json['orderTotalPrice'] as num)?.toDouble(),
      json['cartId'] as int,
      json['couponId'] as int,
      (json['goodsTotalPrice'] as num)?.toDouble(),
      json['addressId'] as int,
      (json['grouponPrice'] as num)?.toDouble(),
      json['checkedAddress'] == null
          ? null
          : CheckedAddress.fromJson(
              json['checkedAddress'] as Map<String, dynamic>),
      (json['couponPrice'] as num)?.toDouble(),
      json['availableCouponLength'] as int,
      (json['freightPrice'] as num)?.toDouble(),
      (json['checkedGoodsList'] as List)
          ?.map((e) => e == null
              ? null
              : CheckedGoodsList.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$FillInOrderEntityToJson(FillInOrderEntity instance) =>
    <String, dynamic>{
      'grouponRulesId': instance.grouponRulesId,
      'actualPrice': instance.actualPrice,
      'orderTotalPrice': instance.orderTotalPrice,
      'cartId': instance.cartId,
      'couponId': instance.couponId,
      'goodsTotalPrice': instance.goodsTotalPrice,
      'addressId': instance.addressId,
      'grouponPrice': instance.grouponPrice,
      'checkedAddress': instance.checkedAddress,
      'couponPrice': instance.couponPrice,
      'availableCouponLength': instance.availableCouponLength,
      'freightPrice': instance.freightPrice,
      'checkedGoodsList': instance.checkedGoodsList
    };

CheckedAddress _$CheckedAddressFromJson(Map<String, dynamic> json) {
  return CheckedAddress(
      json['id'] as int,
      json['name'] as String,
      json['userId'] as int,
      json['province'] as String,
      json['city'] as String,
      json['county'] as String,
      json['addressDetail'] as String,
      json['areaCode'] as String,
      json['tel'] as String,
      json['isDefault'] as bool,
      json['addTime'] as String,
      json['updateTime'] as String,
      json['deleted'] as bool);
}

Map<String, dynamic> _$CheckedAddressToJson(CheckedAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userId': instance.userId,
      'province': instance.province,
      'city': instance.city,
      'county': instance.county,
      'addressDetail': instance.addressDetail,
      'areaCode': instance.areaCode,
      'tel': instance.tel,
      'isDefault': instance.isDefault,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted
    };

CheckedGoodsList _$CheckedGoodsListFromJson(Map<String, dynamic> json) {
  return CheckedGoodsList(
      json['id'] as int,
      json['userId'] as int,
      json['goodsId'] as int,
      json['goodsSn'] as String,
      json['goodsName'] as String,
      json['productId'] as int,
      (json['price'] as num)?.toDouble(),
      json['number'] as int,
      (json['specifications'] as List)?.map((e) => e as String)?.toList(),
      json['checked'] as bool,
      json['picUrl'] as String,
      json['addTime'] as String,
      json['updateTime'] as String,
      json['deleted'] as bool);
}

Map<String, dynamic> _$CheckedGoodsListToJson(CheckedGoodsList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'goodsId': instance.goodsId,
      'goodsSn': instance.goodsSn,
      'goodsName': instance.goodsName,
      'productId': instance.productId,
      'price': instance.price,
      'number': instance.number,
      'specifications': instance.specifications,
      'checked': instance.checked,
      'picUrl': instance.picUrl,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted
    };
