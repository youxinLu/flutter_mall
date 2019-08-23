import 'package:json_annotation/json_annotation.dart';

part 'home_entity.g.dart';


@JsonSerializable()
class HomeEntity extends Object {

  @JsonKey(name: 'newGoods')
  List<Goods> newGoods;

  @JsonKey(name: 'brands')
  List<Brand> brands;

  @JsonKey(name: 'hotGoods')
  List<Goods> hotGoods;

  @JsonKey(name: 'couponList')
  List<Coupon> couponList;

  @JsonKey(name: 'floorGoods')
  List<FloorGoods> floorGoods;

  @JsonKey(name: 'categories')
  List<Categorie> categories;

  @JsonKey(name: 'projectSelections')
  List<ProjectSelection> projectSelections;

  @JsonKey(name: 'groupons')
  List<Groupon> groupons;

  @JsonKey(name: 'banners')
  List<MallBanner> banners;

  HomeEntity(this.newGoods,this.brands,this.hotGoods,this.couponList,this.floorGoods,this.categories,this.projectSelections,this.groupons,this.banners,);

  factory HomeEntity.fromJson(Map<String, dynamic> srcJson) => _$HomeEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeEntityToJson(this);

}


@JsonSerializable()
class Goods extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'brief')
  String brief;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'isNew')
  bool isNew;

  @JsonKey(name: 'isHot')
  bool isHot;

  @JsonKey(name: 'counterPrice')
  double counterPrice;

  @JsonKey(name: 'retailPrice')
  double retailPrice;

  Goods(this.id,this.name,this.brief,this.picUrl,this.isNew,this.isHot,this.counterPrice,this.retailPrice,);

  factory Goods.fromJson(Map<String, dynamic> srcJson) => _$GoodsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodsToJson(this);

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

  @JsonKey(name: 'floorPrice')
  double floorPrice;

  Brand(this.id,this.name,this.desc,this.picUrl,this.floorPrice,);

  factory Brand.fromJson(Map<String, dynamic> srcJson) => _$BrandFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BrandToJson(this);

}




@JsonSerializable()
class Coupon extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'tag')
  String tag;

  @JsonKey(name: 'discount')
  double discount;

  @JsonKey(name: 'min')
  double min;

  @JsonKey(name: 'days')
  int days;

  Coupon(this.id,this.name,this.desc,this.tag,this.discount,this.min,this.days,);

  factory Coupon.fromJson(Map<String, dynamic> srcJson) => _$CouponFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CouponToJson(this);

}


@JsonSerializable()
class FloorGoods extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'goodsList')
  List<Goods> goodsList;

  @JsonKey(name: 'id')
  int id;

  FloorGoods(this.name,this.goodsList,this.id,);

  factory FloorGoods.fromJson(Map<String, dynamic> srcJson) => _$FloorGoodsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FloorGoodsToJson(this);

}





@JsonSerializable()
class Categorie extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'iconUrl')
  String iconUrl;

  Categorie(this.id,this.name,this.iconUrl,);

  factory Categorie.fromJson(Map<String, dynamic> srcJson) => _$CategorieFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategorieToJson(this);

}


@JsonSerializable()
class ProjectSelection extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'subtitle')
  String subtitle;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'readCount')
  String readCount;

  @JsonKey(name: 'picUrl')
  String picUrl;

  ProjectSelection(this.id,this.title,this.subtitle,this.price,this.readCount,this.picUrl,);

  factory ProjectSelection.fromJson(Map<String, dynamic> srcJson) => _$ProjectSelectionFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProjectSelectionToJson(this);

}


@JsonSerializable()
class Groupon extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'brief')
  String brief;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'counterPrice')
  double counterPrice;

  @JsonKey(name: 'retailPrice')
  double retailPrice;

  @JsonKey(name: 'grouponPrice')
  double grouponPrice;

  @JsonKey(name: 'grouponDiscount')
  int grouponDiscount;

  @JsonKey(name: 'grouponMember')
  int grouponMember;

  Groupon(this.id,this.name,this.brief,this.picUrl,this.counterPrice,this.retailPrice,this.grouponPrice,this.grouponDiscount,this.grouponMember,);

  factory Groupon.fromJson(Map<String, dynamic> srcJson) => _$GrouponFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GrouponToJson(this);

}


@JsonSerializable()
class MallBanner extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'position')
  int position;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'enabled')
  bool enabled;

  @JsonKey(name: 'addTime')
  String addTime;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'deleted')
  bool deleted;

  MallBanner(this.id,this.name,this.link,this.url,this.position,this.content,this.enabled,this.addTime,this.updateTime,this.deleted,);

  factory MallBanner.fromJson(Map<String, dynamic> srcJson) => _$MallBannerFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MallBannerToJson(this);

}


