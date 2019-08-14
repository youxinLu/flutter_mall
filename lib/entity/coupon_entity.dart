import 'package:json_annotation/json_annotation.dart';

part 'coupon_entity.g.dart';

class CouponListEntity {
  List<CouponEntity> couponEntityList;

  CouponListEntity(this.couponEntityList);

  factory CouponListEntity.fromJson(List<dynamic> parseJson) {
    List<CouponEntity> couponEntityList;

    couponEntityList = parseJson.map((i) => CouponEntity.fromJson(i)).toList();
    return CouponListEntity(couponEntityList);
  }
}

@JsonSerializable()
class CouponEntity extends Object {
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

  CouponEntity(
    this.id,
    this.name,
    this.desc,
    this.tag,
    this.discount,
    this.min,
    this.days,
  );

  factory CouponEntity.fromJson(Map<String, dynamic> srcJson) =>
      _$CouponEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CouponEntityToJson(this);
}
