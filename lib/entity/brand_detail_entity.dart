import 'package:json_annotation/json_annotation.dart';

part 'brand_detail_entity.g.dart';


@JsonSerializable()
class BrandDetailEntity extends Object {

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

  BrandDetailEntity(this.id,this.name,this.desc,this.picUrl,this.floorPrice,);

  factory BrandDetailEntity.fromJson(Map<String, dynamic> srcJson) => _$BrandDetailEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BrandDetailEntityToJson(this);

}


