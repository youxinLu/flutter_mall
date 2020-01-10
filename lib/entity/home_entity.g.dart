// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeEntity _$HomeEntityFromJson(Map<String, dynamic> json) {
  return HomeEntity(
      (json['newGoodsList'] as List)
          ?.map((e) =>
              e == null ? null : Goods.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['couponList'] as List)
          ?.map((e) =>
              e == null ? null : CouponList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['channel'] as List)
          ?.map((e) =>
              e == null ? null : Channel.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['grouponList'] as List)
          ?.map((e) => e == null
              ? null
              : GrouponList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['banner'] as List)
          ?.map((e) =>
              e == null ? null : MallBanner.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['brandList'] as List)
          ?.map((e) =>
              e == null ? null : BrandList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['hotGoodsList'] as List)
          ?.map((e) =>
              e == null ? null : Goods.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['topicList'] as List)
          ?.map((e) =>
              e == null ? null : TopicList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['floorGoodsList'] as List)
          ?.map((e) => e == null
              ? null
              : FloorGoodsList.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$HomeEntityToJson(HomeEntity instance) =>
    <String, dynamic>{
      'newGoodsList': instance.newGoodsList,
      'couponList': instance.couponList,
      'channel': instance.channel,
      'grouponList': instance.grouponList,
      'banner': instance.banner,
      'brandList': instance.brandList,
      'hotGoodsList': instance.hotGoodsList,
      'topicList': instance.topicList,
      'floorGoodsList': instance.floorGoodsList
    };

Goods _$GoodsFromJson(Map<String, dynamic> json) {
  return Goods(
      json['id'] as int,
      json['name'] as String,
      json['brief'] as String,
      json['picUrl'] as String,
      json['isNew'] as bool,
      json['isHot'] as bool,
      (json['counterPrice'] as num)?.toDouble(),
      (json['retailPrice'] as num)?.toDouble());
}

Map<String, dynamic> _$GoodsToJson(Goods instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brief': instance.brief,
      'picUrl': instance.picUrl,
      'isNew': instance.isNew,
      'isHot': instance.isHot,
      'counterPrice': instance.counterPrice,
      'retailPrice': instance.retailPrice
    };

CouponList _$CouponListFromJson(Map<String, dynamic> json) {
  return CouponList(
      json['id'] as int,
      json['name'] as String,
      json['desc'] as String,
      json['tag'] as String,
      (json['discount'] as num)?.toDouble(),
      (json['min'] as num)?.toDouble(),
      json['days'] as int);
}

Map<String, dynamic> _$CouponListToJson(CouponList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desc': instance.desc,
      'tag': instance.tag,
      'discount': instance.discount,
      'min': instance.min,
      'days': instance.days
    };

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return Channel(
      json['id'] as int, json['name'] as String, json['iconUrl'] as String);
}

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconUrl': instance.iconUrl
    };

GrouponList _$GrouponListFromJson(Map<String, dynamic> json) {
  return GrouponList(
      json['id'] as int,
      json['name'] as String,
      json['brief'] as String,
      json['picUrl'] as String,
      (json['counterPrice'] as num)?.toDouble(),
      (json['retailPrice'] as num)?.toDouble(),
      (json['grouponPrice'] as num)?.toDouble(),
      json['grouponDiscount'] as int,
      json['grouponMember'] as int);
}

Map<String, dynamic> _$GrouponListToJson(GrouponList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brief': instance.brief,
      'picUrl': instance.picUrl,
      'counterPrice': instance.counterPrice,
      'retailPrice': instance.retailPrice,
      'grouponPrice': instance.grouponPrice,
      'grouponDiscount': instance.grouponDiscount,
      'grouponMember': instance.grouponMember
    };

MallBanner _$MallBannerFromJson(Map<String, dynamic> json) {
  return MallBanner(
      json['id'] as int,
      json['name'] as String,
      json['link'] as String,
      json['url'] as String,
      json['position'] as int,
      json['content'] as String,
      json['enabled'] as bool,
      json['addTime'] as String,
      json['updateTime'] as String,
      json['deleted'] as bool);
}

Map<String, dynamic> _$MallBannerToJson(MallBanner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'link': instance.link,
      'url': instance.url,
      'position': instance.position,
      'content': instance.content,
      'enabled': instance.enabled,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted
    };

BrandList _$BrandListFromJson(Map<String, dynamic> json) {
  return BrandList(
      json['id'] as int,
      json['name'] as String,
      json['desc'] as String,
      json['picUrl'] as String,
      (json['floorPrice'] as num)?.toDouble());
}

Map<String, dynamic> _$BrandListToJson(BrandList instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desc': instance.desc,
      'picUrl': instance.picUrl,
      'floorPrice': instance.floorPrice
    };

HotGoodsList _$HotGoodsListFromJson(Map<String, dynamic> json) {
  return HotGoodsList(
      json['id'] as int,
      json['name'] as String,
      json['brief'] as String,
      json['picUrl'] as String,
      json['isNew'] as bool,
      json['isHot'] as bool,
      (json['counterPrice'] as num)?.toDouble(),
      (json['retailPrice'] as num)?.toDouble());
}

Map<String, dynamic> _$HotGoodsListToJson(HotGoodsList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brief': instance.brief,
      'picUrl': instance.picUrl,
      'isNew': instance.isNew,
      'isHot': instance.isHot,
      'counterPrice': instance.counterPrice,
      'retailPrice': instance.retailPrice
    };

TopicList _$TopicListFromJson(Map<String, dynamic> json) {
  return TopicList(
      json['id'] as int,
      json['title'] as String,
      json['subtitle'] as String,
      (json['price'] as num)?.toDouble(),
      json['readCount'] as String,
      json['picUrl'] as String);
}

Map<String, dynamic> _$TopicListToJson(TopicList instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'price': instance.price,
      'readCount': instance.readCount,
      'picUrl': instance.picUrl
    };

FloorGoodsList _$FloorGoodsListFromJson(Map<String, dynamic> json) {
  return FloorGoodsList(
      json['name'] as String,
      (json['goodsList'] as List)
          ?.map((e) =>
              e == null ? null : Goods.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['id'] as int);
}

Map<String, dynamic> _$FloorGoodsListToJson(FloorGoodsList instance) =>
    <String, dynamic>{
      'name': instance.name,
      'goodsList': instance.goodsList,
      'id': instance.id
    };
