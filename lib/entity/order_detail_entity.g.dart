// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailEntity _$OrderDetailEntityFromJson(Map<String, dynamic> json) {
  return OrderDetailEntity(
      json['orderInfo'] == null
          ? null
          : OrderInfo.fromJson(json['orderInfo'] as Map<String, dynamic>),
      (json['orderGoods'] as List)
          ?.map((e) =>
              e == null ? null : OrderGoods.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$OrderDetailEntityToJson(OrderDetailEntity instance) =>
    <String, dynamic>{
      'orderInfo': instance.orderInfo,
      'orderGoods': instance.orderGoods
    };

OrderInfo _$OrderInfoFromJson(Map<String, dynamic> json) {
  return OrderInfo(
      json['consignee'] as String,
      json['address'] as String,
      json['addTime'] as String,
      json['orderSn'] as String,
      (json['actualPrice'] as num)?.toDouble(),
      json['mobile'] as String,
      json['orderStatusText'] as String,
      (json['goodsPrice'] as num)?.toDouble(),
      (json['couponPrice'] as num)?.toDouble(),
      json['id'] as int,
      (json['freightPrice'] as num)?.toDouble(),
      json['handleOption'] as bool,
      json['isDelete'] as bool);
}

Map<String, dynamic> _$OrderInfoToJson(OrderInfo instance) => <String, dynamic>{
      'consignee': instance.consignee,
      'address': instance.address,
      'addTime': instance.addTime,
      'orderSn': instance.orderSn,
      'actualPrice': instance.actualPrice,
      'mobile': instance.mobile,
      'orderStatusText': instance.orderStatusText,
      'goodsPrice': instance.goodsPrice,
      'couponPrice': instance.couponPrice,
      'id': instance.id,
      'freightPrice': instance.freightPrice,
      'handleOption': instance.handleOption,
      'isDelete': instance.isDelete
    };

OrderGoods _$OrderGoodsFromJson(Map<String, dynamic> json) {
  return OrderGoods(
      json['id'] as int,
      json['orderId'] as String,
      json['goodsId'] as String,
      json['goodsName'] as String,
      json['goodsSn'] as String,
      json['productId'] as String,
      json['number'] as int,
      (json['price'] as num)?.toDouble(),
      json['specifications'] as String,
      json['picUrl'] as String,
      json['comment'] as String,
      json['addTime'] as String,
      json['updateTime'] as String,
      json['deleted'] as bool);
}

Map<String, dynamic> _$OrderGoodsToJson(OrderGoods instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'goodsId': instance.goodsId,
      'goodsName': instance.goodsName,
      'goodsSn': instance.goodsSn,
      'productId': instance.productId,
      'number': instance.number,
      'price': instance.price,
      'specifications': instance.specifications,
      'picUrl': instance.picUrl,
      'comment': instance.comment,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted
    };
