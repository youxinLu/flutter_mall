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
      (json['list'] as List)
          ?.map((e) =>
              e == null ? null : ListData.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$OrderEntityToJson(OrderEntity instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pages': instance.pages,
      'limit': instance.limit,
      'page': instance.page,
      'list': instance.list
    };

ListData _$ListDataFromJson(Map<String, dynamic> json) {
  return ListData(
      json['orderStatusText'] as String,
      json['isGroupin'] as bool,
      json['orderSn'] as String,
      (json['actualPrice'] as num)?.toDouble(),
      (json['goodsList'] as List)
          ?.map((e) =>
              e == null ? null : GoodsList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['id'] as int,
      json['handleOption'] == null
          ? null
          : HandleOption.fromJson(
              json['handleOption'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ListDataToJson(ListData instance) => <String, dynamic>{
      'orderStatusText': instance.orderStatusText,
      'isGroupin': instance.isGroupin,
      'orderSn': instance.orderSn,
      'actualPrice': instance.actualPrice,
      'goodsList': instance.goodsList,
      'id': instance.id,
      'handleOption': instance.handleOption
    };

GoodsList _$GoodsListFromJson(Map<String, dynamic> json) {
  return GoodsList(
      json['number'] as int,
      json['picUrl'] as String,
      (json['price'] as num)?.toDouble(),
      json['id'] as int,
      json['goodsName'] as String,
      (json['specifications'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$GoodsListToJson(GoodsList instance) => <String, dynamic>{
      'number': instance.number,
      'picUrl': instance.picUrl,
      'price': instance.price,
      'id': instance.id,
      'goodsName': instance.goodsName,
      'specifications': instance.specifications
    };

HandleOption _$HandleOptionFromJson(Map<String, dynamic> json) {
  return HandleOption(
      json['cancel'] as bool,
      json['delete'] as bool,
      json['pay'] as bool,
      json['comment'] as bool,
      json['confirm'] as bool,
      json['refund'] as bool,
      json['rebuy'] as bool);
}

Map<String, dynamic> _$HandleOptionToJson(HandleOption instance) =>
    <String, dynamic>{
      'cancel': instance.cancel,
      'delete': instance.delete,
      'pay': instance.pay,
      'comment': instance.comment,
      'confirm': instance.confirm,
      'refund': instance.refund,
      'rebuy': instance.rebuy
    };
