// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeEntity _$HomeEntityFromJson(Map<String, dynamic> json) {
  return HomeEntity(
      (json['newGoods'] as List)
          ?.map((e) =>
              e == null ? null : Goods.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['brands'] as List)
          ?.map((e) =>
              e == null ? null : Brand.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['hotGoods'] as List)
          ?.map((e) =>
              e == null ? null : Goods.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['couponList'] as List)
          ?.map((e) =>
              e == null ? null : Coupon.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['floorGoods'] as List)
          ?.map((e) =>
              e == null ? null : FloorGoods.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['categories'] as List)
          ?.map((e) =>
              e == null ? null : Categorie.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['projectSelections'] as List)
          ?.map((e) => e == null
              ? null
              : ProjectSelection.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['groupons'] as List)
          ?.map((e) =>
              e == null ? null : Groupon.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['banners'] as List)
          ?.map((e) =>
              e == null ? null : MallBanner.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$HomeEntityToJson(HomeEntity instance) =>
    <String, dynamic>{
      'newGoods': instance.newGoods,
      'brands': instance.brands,
      'hotGoods': instance.hotGoods,
      'couponList': instance.couponList,
      'floorGoods': instance.floorGoods,
      'categories': instance.categories,
      'projectSelections': instance.projectSelections,
      'groupons': instance.groupons,
      'banners': instance.banners
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

Brand _$BrandFromJson(Map<String, dynamic> json) {
  return Brand(
      json['id'] as int,
      json['name'] as String,
      json['desc'] as String,
      json['picUrl'] as String,
      (json['floorPrice'] as num)?.toDouble());
}

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desc': instance.desc,
      'picUrl': instance.picUrl,
      'floorPrice': instance.floorPrice
    };

Coupon _$CouponFromJson(Map<String, dynamic> json) {
  return Coupon(
      json['id'] as int,
      json['name'] as String,
      json['desc'] as String,
      json['tag'] as String,
      (json['discount'] as num)?.toDouble(),
      (json['min'] as num)?.toDouble(),
      json['days'] as int);
}

Map<String, dynamic> _$CouponToJson(Coupon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desc': instance.desc,
      'tag': instance.tag,
      'discount': instance.discount,
      'min': instance.min,
      'days': instance.days
    };

FloorGoods _$FloorGoodsFromJson(Map<String, dynamic> json) {
  return FloorGoods(
      json['name'] as String,
      (json['goodsList'] as List)
          ?.map((e) =>
              e == null ? null : Goods.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['id'] as int);
}

Map<String, dynamic> _$FloorGoodsToJson(FloorGoods instance) =>
    <String, dynamic>{
      'name': instance.name,
      'goodsList': instance.goodsList,
      'id': instance.id
    };

Categorie _$CategorieFromJson(Map<String, dynamic> json) {
  return Categorie(
      json['id'] as int, json['name'] as String, json['iconUrl'] as String);
}

Map<String, dynamic> _$CategorieToJson(Categorie instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconUrl': instance.iconUrl
    };

ProjectSelection _$ProjectSelectionFromJson(Map<String, dynamic> json) {
  return ProjectSelection(
      json['id'] as int,
      json['title'] as String,
      json['subtitle'] as String,
      (json['price'] as num)?.toDouble(),
      json['readCount'] as String,
      json['picUrl'] as String);
}

Map<String, dynamic> _$ProjectSelectionToJson(ProjectSelection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'price': instance.price,
      'readCount': instance.readCount,
      'picUrl': instance.picUrl
    };

Groupon _$GrouponFromJson(Map<String, dynamic> json) {
  return Groupon(
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

Map<String, dynamic> _$GrouponToJson(Groupon instance) => <String, dynamic>{
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
