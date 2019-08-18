import 'package:json_annotation/json_annotation.dart';

part 'order_detail_entity.g.dart';


@JsonSerializable()
class OrderDetailEntity extends Object {

  @JsonKey(name: 'orderInfo')
  OrderInfo orderInfo;

  @JsonKey(name: 'orderGoods')
  List<OrderGoods> orderGoods;

  OrderDetailEntity(this.orderInfo,this.orderGoods,);

  factory OrderDetailEntity.fromJson(Map<String, dynamic> srcJson) => _$OrderDetailEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OrderDetailEntityToJson(this);

}


@JsonSerializable()
class OrderInfo extends Object {

  @JsonKey(name: 'consignee')
  String consignee;

  @JsonKey(name: 'address')
  String address;

  @JsonKey(name: 'addTime')
  String addTime;

  @JsonKey(name: 'orderSn')
  String orderSn;

  @JsonKey(name: 'actualPrice')
  double actualPrice;

  @JsonKey(name: 'mobile')
  String mobile;

  @JsonKey(name: 'orderStatusText')
  String orderStatusText;

  @JsonKey(name: 'goodsPrice')
  double goodsPrice;

  @JsonKey(name: 'couponPrice')
  double couponPrice;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'freightPrice')
  double freightPrice;

  @JsonKey(name: 'handleOption')
  bool handleOption;
  @JsonKey(name: 'isDelete')
  bool isDelete;
  OrderInfo(this.consignee,this.address,this.addTime,this.orderSn,this.actualPrice,this.mobile,this.orderStatusText,this.goodsPrice,this.couponPrice,this.id,this.freightPrice,this.handleOption,this.isDelete);

  factory OrderInfo.fromJson(Map<String, dynamic> srcJson) => _$OrderInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OrderInfoToJson(this);

}


@JsonSerializable()
class OrderGoods extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'orderId')
  String orderId;

  @JsonKey(name: 'goodsId')
  String goodsId;

  @JsonKey(name: 'goodsName')
  String goodsName;

  @JsonKey(name: 'goodsSn')
  String goodsSn;

  @JsonKey(name: 'productId')
  String productId;

  @JsonKey(name: 'number')
  int number;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'specifications')
  String specifications;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'comment')
  String comment;

  @JsonKey(name: 'addTime')
  String addTime;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'deleted')
  bool deleted;

  OrderGoods(this.id,this.orderId,this.goodsId,this.goodsName,this.goodsSn,this.productId,this.number,this.price,this.specifications,this.picUrl,this.comment,this.addTime,this.updateTime,this.deleted,);

  factory OrderGoods.fromJson(Map<String, dynamic> srcJson) => _$OrderGoodsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OrderGoodsToJson(this);

}


