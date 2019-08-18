// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderEntity _$OrderEntityFromJson(Map<String, dynamic> json) {
  return OrderEntity(
      json['total'] as int,
      json['pages'] as int,
      json['limit'] as int,
      json['page'] as int,
      (json['listData'] as List)
          ?.map((e) =>
              e == null ? null : Order.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$OrderEntityToJson(OrderEntity instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pages': instance.pages,
      'limit': instance.limit,
      'page': instance.page,
      'listData': instance.listData
    };

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
      json['orderStatusText'] as String,
      json['isGroupin'] as bool,
      json['orderSn'] as String,
      (json['actualPrice'] as num)?.toDouble(),
      (json['goodsList'] as List)
          ?.map((e) =>
              e == null ? null : Goods.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['id'] as int,
      json['handleOption'] as bool);
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'orderStatusText': instance.orderStatusText,
      'isGroupin': instance.isGroupin,
      'orderSn': instance.orderSn,
      'actualPrice': instance.actualPrice,
      'goodsList': instance.goodsList,
      'id': instance.id,
      'handleOption': instance.handleOption
    };

Goods _$GoodsFromJson(Map<String, dynamic> json) {
  return Goods(
      json['number'] as int,
      json['picUrl'] as String,
      json['id'] as int,
      json['goodsName'] as String,
      (json['price'] as num)?.toDouble(),
      (json['specifications'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$GoodsToJson(Goods instance) => <String, dynamic>{
      'number': instance.number,
      'picUrl': instance.picUrl,
      'id': instance.id,
      'goodsName': instance.goodsName,
      'price': instance.price,
      'specifications': instance.specifications
    };
