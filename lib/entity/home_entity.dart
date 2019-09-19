import 'package:json_annotation/json_annotation.dart';

part 'home_entity.g.dart';


@JsonSerializable()
class HomeEntity extends Object {

  @JsonKey(name: 'newGoodsList')
  List<Goods> newGoodsList;

  @JsonKey(name: 'couponList')
  List<CouponList> couponList;

  @JsonKey(name: 'channel')
  List<Channel> channel;

  @JsonKey(name: 'grouponList')
  List<GrouponList> grouponList;

  @JsonKey(name: 'banner')
  List<MallBanner> banner;

  @JsonKey(name: 'brandList')
  List<BrandList> brandList;

  @JsonKey(name: 'hotGoodsList')
  List<Goods> hotGoodsList;

  @JsonKey(name: 'topicList')
  List<TopicList> topicList;

  @JsonKey(name: 'floorGoodsList')
  List<FloorGoodsList> floorGoodsList;

  HomeEntity(this.newGoodsList,this.couponList,this.channel,this.grouponList,this.banner,this.brandList,this.hotGoodsList,this.topicList,this.floorGoodsList,);

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
class CouponList extends Object {

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

  CouponList(this.id,this.name,this.desc,this.tag,this.discount,this.min,this.days,);

  factory CouponList.fromJson(Map<String, dynamic> srcJson) => _$CouponListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CouponListToJson(this);

}


@JsonSerializable()
class Channel extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'iconUrl')
  String iconUrl;

  Channel(this.id,this.name,this.iconUrl,);

  factory Channel.fromJson(Map<String, dynamic> srcJson) => _$ChannelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ChannelToJson(this);

}


@JsonSerializable()
class GrouponList extends Object {

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

  GrouponList(this.id,this.name,this.brief,this.picUrl,this.counterPrice,this.retailPrice,this.grouponPrice,this.grouponDiscount,this.grouponMember,);

  factory GrouponList.fromJson(Map<String, dynamic> srcJson) => _$GrouponListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GrouponListToJson(this);

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


@JsonSerializable()
class BrandList extends Object {

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

  BrandList(this.id,this.name,this.desc,this.picUrl,this.floorPrice,);

  factory BrandList.fromJson(Map<String, dynamic> srcJson) => _$BrandListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BrandListToJson(this);

}


@JsonSerializable()
class HotGoodsList extends Object {

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

  HotGoodsList(this.id,this.name,this.brief,this.picUrl,this.isNew,this.isHot,this.counterPrice,this.retailPrice,);

  factory HotGoodsList.fromJson(Map<String, dynamic> srcJson) => _$HotGoodsListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HotGoodsListToJson(this);

}


@JsonSerializable()
class TopicList extends Object {

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

  TopicList(this.id,this.title,this.subtitle,this.price,this.readCount,this.picUrl,);

  factory TopicList.fromJson(Map<String, dynamic> srcJson) => _$TopicListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TopicListToJson(this);

}


@JsonSerializable()
class FloorGoodsList extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'goodsList')
  List<Goods> goodsList;

  @JsonKey(name: 'id')
  int id;

  FloorGoodsList(this.name,this.goodsList,this.id,);

  factory FloorGoodsList.fromJson(Map<String, dynamic> srcJson) => _$FloorGoodsListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FloorGoodsListToJson(this);

}






