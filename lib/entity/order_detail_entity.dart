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
  HandleOption handleOption;

  OrderInfo(this.consignee,this.address,this.addTime,this.orderSn,this.actualPrice,this.mobile,this.orderStatusText,this.goodsPrice,this.couponPrice,this.id,this.freightPrice,this.handleOption,);

  factory OrderInfo.fromJson(Map<String, dynamic> srcJson) => _$OrderInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OrderInfoToJson(this);

}


@JsonSerializable()
class HandleOption extends Object {

  @JsonKey(name: 'cancel')
  bool cancel;

  @JsonKey(name: 'delete')
  bool delete;

  @JsonKey(name: 'pay')
  bool pay;

  @JsonKey(name: 'comment')
  bool comment;

  @JsonKey(name: 'confirm')
  bool confirm;

  @JsonKey(name: 'refund')
  bool refund;

  @JsonKey(name: 'rebuy')
  bool rebuy;

  HandleOption(this.cancel,this.delete,this.pay,this.comment,this.confirm,this.refund,this.rebuy,);

  factory HandleOption.fromJson(Map<String, dynamic> srcJson) => _$HandleOptionFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HandleOptionToJson(this);

}


@JsonSerializable()
class OrderGoods extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'orderId')
  int orderId;

  @JsonKey(name: 'goodsId')
  int goodsId;

  @JsonKey(name: 'goodsName')
  String goodsName;

  @JsonKey(name: 'goodsSn')
  String goodsSn;

  @JsonKey(name: 'productId')
  int productId;

  @JsonKey(name: 'number')
  int number;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'specifications')
  List<String> specifications;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'comment')
  int comment;

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


