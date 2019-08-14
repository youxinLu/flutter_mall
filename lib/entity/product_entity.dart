import 'package:json_annotation/json_annotation.dart';

part 'product_entity.g.dart';

class ProductListEntity {
  List<ProductEntity> productEntitys;

  ProductListEntity(this.productEntitys);

  factory ProductListEntity.fromJson(List<dynamic> parseJson) {
    List<ProductEntity> productEntitys;
    productEntitys = parseJson.map((i) => ProductEntity.fromJson(i)).toList();
    return ProductListEntity(productEntitys);
  }
}

@JsonSerializable()
class ProductEntity extends Object {
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

  ProductEntity(
    this.id,
    this.name,
    this.brief,
    this.picUrl,
    this.isNew,
    this.isHot,
    this.counterPrice,
    this.retailPrice,
  );

  factory ProductEntity.fromJson(Map<String, dynamic> srcJson) =>
      _$ProductEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProductEntityToJson(this);
}
