// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartListEntity _$CartListEntityFromJson(Map<String, dynamic> json) {
  return CartListEntity(
      json['cartTotal'] == null
          ? null
          : CartTotal.fromJson(json['cartTotal'] as Map<String, dynamic>),
      (json['cartList'] as List)
          ?.map((e) =>
              e == null ? null : CartList.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CartListEntityToJson(CartListEntity instance) =>
    <String, dynamic>{
      'cartTotal': instance.cartTotal,
      'cartList': instance.cartList
    };

CartTotal _$CartTotalFromJson(Map<String, dynamic> json) {
  return CartTotal(
      json['goodsCount'] as int,
      json['checkedGoodsCount'] as int,
      (json['goodsAmount'] as num)?.toDouble(),
      (json['checkedGoodsAmount'] as num)?.toDouble());
}

Map<String, dynamic> _$CartTotalToJson(CartTotal instance) => <String, dynamic>{
      'goodsCount': instance.goodsCount,
      'checkedGoodsCount': instance.checkedGoodsCount,
      'goodsAmount': instance.goodsAmount,
      'checkedGoodsAmount': instance.checkedGoodsAmount
    };

CartList _$CartListFromJson(Map<String, dynamic> json) {
  return CartList(
      json['id'] as int,
      json['isCheck'] as bool,
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

Map<String, dynamic> _$CartListToJson(CartList instance) => <String, dynamic>{
      'id': instance.id,
      'isCheck': instance.isCheck,
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
