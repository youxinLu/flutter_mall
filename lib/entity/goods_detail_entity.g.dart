// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsDetailEntity _$GoodsDetailEntityFromJson(Map<String, dynamic> json) {
  return GoodsDetailEntity(
      (json['specificationList'] as List)
          ?.map((e) => e == null
              ? null
              : SpecificationList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['groupon'] as List,
      (json['issue'] as List)
          ?.map((e) =>
              e == null ? null : Issue.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['userHasCollect'] as int,
      json['shareImage'] as String,
      json['comment'] == null
          ? null
          : Comment.fromJson(json['comment'] as Map<String, dynamic>),
      (json['attribute'] as List)
          ?.map((e) =>
              e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
      (json['productList'] as List)
          ?.map((e) => e == null
              ? null
              : ProductList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['info'] == null
          ? null
          : Info.fromJson(json['info'] as Map<String, dynamic>));
}

Map<String, dynamic> _$GoodsDetailEntityToJson(GoodsDetailEntity instance) =>
    <String, dynamic>{
      'specificationList': instance.specificationList,
      'groupon': instance.groupon,
      'issue': instance.issue,
      'userHasCollect': instance.userHasCollect,
      'shareImage': instance.shareImage,
      'comment': instance.comment,
      'attribute': instance.attribute,
      'brand': instance.brand,
      'productList': instance.productList,
      'info': instance.info
    };

SpecificationList _$SpecificationListFromJson(Map<String, dynamic> json) {
  return SpecificationList(
      json['name'] as String,
      (json['valueList'] as List)
          ?.map((e) =>
              e == null ? null : ValueList.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SpecificationListToJson(SpecificationList instance) =>
    <String, dynamic>{'name': instance.name, 'valueList': instance.valueList};

ValueList _$ValueListFromJson(Map<String, dynamic> json) {
  return ValueList(
      json['id'] as int,
      json['goodsId'] as int,
      json['specification'] as String,
      json['value'] as String,
      json['picUrl'] as String,
      json['addTime'] as String,
      json['updateTime'] as String,
      json['deleted'] as bool);
}

Map<String, dynamic> _$ValueListToJson(ValueList instance) => <String, dynamic>{
      'id': instance.id,
      'goodsId': instance.goodsId,
      'specification': instance.specification,
      'value': instance.value,
      'picUrl': instance.picUrl,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted
    };

Issue _$IssueFromJson(Map<String, dynamic> json) {
  return Issue(
      json['id'] as int,
      json['question'] as String,
      json['answer'] as String,
      json['addTime'] as String,
      json['updateTime'] as String,
      json['deleted'] as bool);
}

Map<String, dynamic> _$IssueToJson(Issue instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted
    };

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(json['data'] as List, json['count'] as int);
}

Map<String, dynamic> _$CommentToJson(Comment instance) =>
    <String, dynamic>{'data': instance.data, 'count': instance.count};

Attribute _$AttributeFromJson(Map<String, dynamic> json) {
  return Attribute(
      json['id'] as int,
      json['goodsId'] as int,
      json['attribute'] as String,
      json['value'] as String,
      json['addTime'] as String,
      json['updateTime'] as String,
      json['deleted'] as bool);
}

Map<String, dynamic> _$AttributeToJson(Attribute instance) => <String, dynamic>{
      'id': instance.id,
      'goodsId': instance.goodsId,
      'attribute': instance.attribute,
      'value': instance.value,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted
    };

Brand _$BrandFromJson(Map<String, dynamic> json) {
  return Brand(
      json['id'] as int,
      json['name'] as String,
      json['desc'] as String,
      json['picUrl'] as String,
      json['sortOrder'] as int,
      (json['floorPrice'] as num)?.toDouble(),
      json['addTime'] as String,
      json['updateTime'] as String,
      json['deleted'] as bool);
}

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desc': instance.desc,
      'picUrl': instance.picUrl,
      'sortOrder': instance.sortOrder,
      'floorPrice': instance.floorPrice,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted
    };

ProductList _$ProductListFromJson(Map<String, dynamic> json) {
  return ProductList(
      json['id'] as int,
      json['goodsId'] as int,
      (json['specifications'] as List)?.map((e) => e as String)?.toList(),
      (json['price'] as num)?.toDouble(),
      json['number'] as int,
      json['url'] as String,
      json['addTime'] as String,
      json['updateTime'] as String,
      json['deleted'] as bool);
}

Map<String, dynamic> _$ProductListToJson(ProductList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'goodsId': instance.goodsId,
      'specifications': instance.specifications,
      'price': instance.price,
      'number': instance.number,
      'url': instance.url,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted
    };

Info _$InfoFromJson(Map<String, dynamic> json) {
  return Info(
      json['id'] as int,
      json['goodsSn'] as String,
      json['name'] as String,
      json['categoryId'] as int,
      json['brandId'] as int,
      (json['gallery'] as List)?.map((e) => e as String)?.toList(),
      json['keywords'] as String,
      json['brief'] as String,
      json['isOnSale'] as bool,
      json['sortOrder'] as int,
      json['picUrl'] as String,
      json['shareUrl'] as String,
      json['isNew'] as bool,
      json['isHot'] as bool,
      json['unit'] as String,
      (json['counterPrice'] as num)?.toDouble(),
      (json['retailPrice'] as num)?.toDouble(),
      json['addTime'] as String,
      json['updateTime'] as String,
      json['deleted'] as bool,
      json['detail'] as String);
}

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'id': instance.id,
      'goodsSn': instance.goodsSn,
      'name': instance.name,
      'categoryId': instance.categoryId,
      'brandId': instance.brandId,
      'gallery': instance.gallery,
      'keywords': instance.keywords,
      'brief': instance.brief,
      'isOnSale': instance.isOnSale,
      'sortOrder': instance.sortOrder,
      'picUrl': instance.picUrl,
      'shareUrl': instance.shareUrl,
      'isNew': instance.isNew,
      'isHot': instance.isHot,
      'unit': instance.unit,
      'counterPrice': instance.counterPrice,
      'retailPrice': instance.retailPrice,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted,
      'detail': instance.detail
    };
