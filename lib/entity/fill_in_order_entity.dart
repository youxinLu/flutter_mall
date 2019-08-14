import 'package:json_annotation/json_annotation.dart';

part 'fill_in_order_entity.g.dart';


@JsonSerializable()
class FillInOrderEntity extends Object {

  @JsonKey(name: 'grouponRulesId')
  int grouponRulesId;

  @JsonKey(name: 'actualPrice')
  double actualPrice;

  @JsonKey(name: 'orderTotalPrice')
  double orderTotalPrice;

  @JsonKey(name: 'cartId')
  int cartId;

  @JsonKey(name: 'couponId')
  int couponId;

  @JsonKey(name: 'goodsTotalPrice')
  double goodsTotalPrice;

  @JsonKey(name: 'addressId')
  int addressId;

  @JsonKey(name: 'grouponPrice')
  double grouponPrice;

  @JsonKey(name: 'checkedAddress')
  CheckedAddress checkedAddress;

  @JsonKey(name: 'couponPrice')
  double couponPrice;

  @JsonKey(name: 'availableCouponLength')
  int availableCouponLength;

  @JsonKey(name: 'freightPrice')
  double freightPrice;

  @JsonKey(name: 'checkedGoodsList')
  List<CheckedGoodsList> checkedGoodsList;

  FillInOrderEntity(this.grouponRulesId,this.actualPrice,this.orderTotalPrice,this.cartId,this.couponId,this.goodsTotalPrice,this.addressId,this.grouponPrice,this.checkedAddress,this.couponPrice,this.availableCouponLength,this.freightPrice,this.checkedGoodsList,);

  factory FillInOrderEntity.fromJson(Map<String, dynamic> srcJson) => _$FillInOrderEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FillInOrderEntityToJson(this);

}


@JsonSerializable()
class CheckedAddress extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'province')
  String province;

  @JsonKey(name: 'city')
  String city;

  @JsonKey(name: 'county')
  String county;

  @JsonKey(name: 'addressDetail')
  String addressDetail;

  @JsonKey(name: 'areaCode')
  String areaCode;

  @JsonKey(name: 'tel')
  String tel;

  @JsonKey(name: 'isDefault')
  bool isDefault;

  @JsonKey(name: 'addTime')
  String addTime;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'deleted')
  bool deleted;

  CheckedAddress(this.id,this.name,this.userId,this.province,this.city,this.county,this.addressDetail,this.areaCode,this.tel,this.isDefault,this.addTime,this.updateTime,this.deleted,);

  factory CheckedAddress.fromJson(Map<String, dynamic> srcJson) => _$CheckedAddressFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CheckedAddressToJson(this);

}


@JsonSerializable()
class CheckedGoodsList extends Object {

  @JsonKey(name: 'id')
  int id;

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

  CheckedGoodsList(this.id,this.userId,this.goodsId,this.goodsSn,this.goodsName,this.productId,this.price,this.number,this.specifications,this.checked,this.picUrl,this.addTime,this.updateTime,this.deleted,);

  factory CheckedGoodsList.fromJson(Map<String, dynamic> srcJson) => _$CheckedGoodsListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CheckedGoodsListToJson(this);

}


