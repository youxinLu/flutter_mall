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

  @JsonKey(name: 'list')
  List<ListData> list;

  OrderEntity(this.total,this.pages,this.limit,this.page,this.list,);

  factory OrderEntity.fromJson(Map<String, dynamic> srcJson) => _$OrderEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OrderEntityToJson(this);

}


@JsonSerializable()
class ListData extends Object {

  @JsonKey(name: 'orderStatusText')
  String orderStatusText;

  @JsonKey(name: 'isGroupin')
  bool isGroupin;

  @JsonKey(name: 'orderSn')
  String orderSn;

  @JsonKey(name: 'actualPrice')
  double actualPrice;

  @JsonKey(name: 'goodsList')
  List<GoodsList> goodsList;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'handleOption')
  HandleOption handleOption;

  ListData(this.orderStatusText,this.isGroupin,this.orderSn,this.actualPrice,this.goodsList,this.id,this.handleOption,);

  factory ListData.fromJson(Map<String, dynamic> srcJson) => _$ListDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ListDataToJson(this);

}


@JsonSerializable()
class GoodsList extends Object {

  @JsonKey(name: 'number')
  int number;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'goodsName')
  String goodsName;

  @JsonKey(name: 'specifications')
  List<String> specifications;

  GoodsList(this.number,this.picUrl,this.price,this.id,this.goodsName,this.specifications,);

  factory GoodsList.fromJson(Map<String, dynamic> srcJson) => _$GoodsListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodsListToJson(this);

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


