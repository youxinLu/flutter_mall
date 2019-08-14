import 'package:json_annotation/json_annotation.dart';

part 'goods_entity.g.dart';

class GoodsListEntity {
  List<GoodsEntity> goodsEntitys;

  GoodsListEntity(this.goodsEntitys);

  factory GoodsListEntity.fromJson(List<dynamic> parseJson) {
    List<GoodsEntity> goodsEntitys;
    goodsEntitys = parseJson.map((i) => GoodsEntity.fromJson(i)).toList();
    return GoodsListEntity(goodsEntitys);
  }
}

@JsonSerializable()
class GoodsEntity extends Object {
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

  GoodsEntity(
    this.id,
    this.name,
    this.brief,
    this.picUrl,
    this.isNew,
    this.isHot,
    this.counterPrice,
    this.retailPrice,
  );

  factory GoodsEntity.fromJson(Map<String, dynamic> srcJson) =>
      _$GoodsEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodsEntityToJson(this);
}
