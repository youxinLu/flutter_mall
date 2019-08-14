import 'package:json_annotation/json_annotation.dart';

part 'goods_detail_entity.g.dart';


@JsonSerializable()
class GoodsDetailEntity extends Object {

  @JsonKey(name: 'specificationList')
  List<SpecificationList> specificationList;

  @JsonKey(name: 'groupon')
  List<dynamic> groupon;

  @JsonKey(name: 'issue')
  List<Issue> issue;

  @JsonKey(name: 'userHasCollect')
  int userHasCollect;

  @JsonKey(name: 'shareImage')
  String shareImage;

  @JsonKey(name: 'comment')
  Comment comment;

  @JsonKey(name: 'attribute')
  List<Attribute> attribute;

  @JsonKey(name: 'brand')
  Brand brand;

  @JsonKey(name: 'productList')
  List<ProductList> productList;

  @JsonKey(name: 'info')
  Info info;

  GoodsDetailEntity(this.specificationList,this.groupon,this.issue,this.userHasCollect,this.shareImage,this.comment,this.attribute,this.brand,this.productList,this.info,);

  factory GoodsDetailEntity.fromJson(Map<String, dynamic> srcJson) => _$GoodsDetailEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodsDetailEntityToJson(this);

}


@JsonSerializable()
class SpecificationList extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'valueList')
  List<ValueList> valueList;

  SpecificationList(this.name,this.valueList,);

  factory SpecificationList.fromJson(Map<String, dynamic> srcJson) => _$SpecificationListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SpecificationListToJson(this);

}


@JsonSerializable()
class ValueList extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'goodsId')
  int goodsId;

  @JsonKey(name: 'specification')
  String specification;

  @JsonKey(name: 'value')
  String value;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'addTime')
  String addTime;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'deleted')
  bool deleted;

  ValueList(this.id,this.goodsId,this.specification,this.value,this.picUrl,this.addTime,this.updateTime,this.deleted,);

  factory ValueList.fromJson(Map<String, dynamic> srcJson) => _$ValueListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ValueListToJson(this);

}


@JsonSerializable()
class Issue extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'question')
  String question;

  @JsonKey(name: 'answer')
  String answer;

  @JsonKey(name: 'addTime')
  String addTime;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'deleted')
  bool deleted;

  Issue(this.id,this.question,this.answer,this.addTime,this.updateTime,this.deleted,);

  factory Issue.fromJson(Map<String, dynamic> srcJson) => _$IssueFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IssueToJson(this);

}


@JsonSerializable()
class Comment extends Object {

  @JsonKey(name: 'data')
  List<dynamic> data;

  @JsonKey(name: 'count')
  int count;

  Comment(this.data,this.count,);

  factory Comment.fromJson(Map<String, dynamic> srcJson) => _$CommentFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CommentToJson(this);

}


@JsonSerializable()
class Attribute extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'goodsId')
  int goodsId;

  @JsonKey(name: 'attribute')
  String attribute;

  @JsonKey(name: 'value')
  String value;

  @JsonKey(name: 'addTime')
  String addTime;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'deleted')
  bool deleted;

  Attribute(this.id,this.goodsId,this.attribute,this.value,this.addTime,this.updateTime,this.deleted,);

  factory Attribute.fromJson(Map<String, dynamic> srcJson) => _$AttributeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AttributeToJson(this);

}


@JsonSerializable()
class Brand extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'sortOrder')
  int sortOrder;

  @JsonKey(name: 'floorPrice')
  double floorPrice;

  @JsonKey(name: 'addTime')
  String addTime;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'deleted')
  bool deleted;

  Brand(this.id,this.name,this.desc,this.picUrl,this.sortOrder,this.floorPrice,this.addTime,this.updateTime,this.deleted,);

  factory Brand.fromJson(Map<String, dynamic> srcJson) => _$BrandFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BrandToJson(this);

}


@JsonSerializable()
class ProductList extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'goodsId')
  int goodsId;

  @JsonKey(name: 'specifications')
  List<String> specifications;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'number')
  int number;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'addTime')
  String addTime;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'deleted')
  bool deleted;

  ProductList(this.id,this.goodsId,this.specifications,this.price,this.number,this.url,this.addTime,this.updateTime,this.deleted,);

  factory ProductList.fromJson(Map<String, dynamic> srcJson) => _$ProductListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProductListToJson(this);

}


@JsonSerializable()
class Info extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'goodsSn')
  String goodsSn;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'categoryId')
  int categoryId;

  @JsonKey(name: 'brandId')
  int brandId;

  @JsonKey(name: 'gallery')
  List<String> gallery;

  @JsonKey(name: 'keywords')
  String keywords;

  @JsonKey(name: 'brief')
  String brief;

  @JsonKey(name: 'isOnSale')
  bool isOnSale;

  @JsonKey(name: 'sortOrder')
  int sortOrder;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'shareUrl')
  String shareUrl;

  @JsonKey(name: 'isNew')
  bool isNew;

  @JsonKey(name: 'isHot')
  bool isHot;

  @JsonKey(name: 'unit')
  String unit;

  @JsonKey(name: 'counterPrice')
  double counterPrice;

  @JsonKey(name: 'retailPrice')
  double retailPrice;

  @JsonKey(name: 'addTime')
  String addTime;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'deleted')
  bool deleted;

  @JsonKey(name: 'detail')
  String detail;

  Info(this.id,this.goodsSn,this.name,this.categoryId,this.brandId,this.gallery,this.keywords,this.brief,this.isOnSale,this.sortOrder,this.picUrl,this.shareUrl,this.isNew,this.isHot,this.unit,this.counterPrice,this.retailPrice,this.addTime,this.updateTime,this.deleted,this.detail,);

  factory Info.fromJson(Map<String, dynamic> srcJson) => _$InfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$InfoToJson(this);

}


