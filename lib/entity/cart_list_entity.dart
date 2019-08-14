import 'package:json_annotation/json_annotation.dart';

part 'cart_list_entity.g.dart';

@JsonSerializable()
class CartListEntity extends Object {
  @JsonKey(name: 'cartTotal')
  CartTotal cartTotal;

  @JsonKey(name: 'cartList')
  List<CartList> cartList;

  CartListEntity(
    this.cartTotal,
    this.cartList,
  );

  factory CartListEntity.fromJson(Map<String, dynamic> srcJson) =>
      _$CartListEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CartListEntityToJson(this);
}

@JsonSerializable()
class CartTotal extends Object {
  @JsonKey(name: 'goodsCount')
  int goodsCount;

  @JsonKey(name: 'checkedGoodsCount')
  int checkedGoodsCount;

  @JsonKey(name: 'goodsAmount')
  double goodsAmount;

  @JsonKey(name: 'checkedGoodsAmount')
  double checkedGoodsAmount;

  CartTotal(
    this.goodsCount,
    this.checkedGoodsCount,
    this.goodsAmount,
    this.checkedGoodsAmount,
  );

  factory CartTotal.fromJson(Map<String, dynamic> srcJson) =>
      _$CartTotalFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CartTotalToJson(this);
}

@JsonSerializable()
class CartList extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'isCheck')
  bool isCheck ;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'goodsId')
  int goodsId;

  @JsonKey(name: 'goodsSn')
  String goodsSn;

  @JsonKey(name: 'goodsName')
  String goodsName;

  @JsonKey(name: 'productId')
  int productId;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'number')
  int number;

  @JsonKey(name: 'specifications')
  List<String> specifications;

  @JsonKey(name: 'checked')
  bool checked;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'addTime')
  String addTime;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'deleted')
  bool deleted;

  CartList(
    this.id,
    this.isCheck,
    this.userId,
    this.goodsId,
    this.goodsSn,
    this.goodsName,
    this.productId,
    this.price,
    this.number,
    this.specifications,
    this.checked,
    this.picUrl,
    this.addTime,
    this.updateTime,
    this.deleted,
  );

  factory CartList.fromJson(Map<String, dynamic> srcJson) =>
      _$CartListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CartListToJson(this);
}
