import 'package:json_annotation/json_annotation.dart';

part 'order_entity.g.dart';


@JsonSerializable()
class OrderEntity extends Object {

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'pages')
  int pages;

  @JsonKey(name: 'limit')
  int limit;

  @JsonKey(name: 'page')
  int page;

  @JsonKey(name: 'listData')
  List<Order> listData;

  OrderEntity(this.total,this.pages,this.limit,this.page,this.listData,);

  factory OrderEntity.fromJson(Map<String, dynamic> srcJson) => _$OrderEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OrderEntityToJson(this);

}


@JsonSerializable()
class Order extends Object {

  @JsonKey(name: 'orderStatusText')
  String orderStatusText;

  @JsonKey(name: 'isGroupin')
  bool isGroupin;

  @JsonKey(name: 'orderSn')
  String orderSn;

  @JsonKey(name: 'actualPrice')
  double actualPrice;

  @JsonKey(name: 'goodsList')
  List<Goods> goodsList;

  @JsonKey(name: 'id')
  int id;

  Order(this.orderStatusText,this.isGroupin,this.orderSn,this.actualPrice,this.goodsList,this.id,);

  factory Order.fromJson(Map<String, dynamic> srcJson) => _$OrderFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

}


@JsonSerializable()
class Goods extends Object {

  @JsonKey(name: 'number')
  int number;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'goodsName')
  String goodsName;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'specifications')
  List<String> specifications;

  Goods (this.number,this.picUrl,this.id,this.goodsName,this.price,this.specifications,);

  factory Goods.fromJson(Map<String, dynamic> srcJson) => _$GoodsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodsToJson(this);

}


