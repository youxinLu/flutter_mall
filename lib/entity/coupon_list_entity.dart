import 'package:json_annotation/json_annotation.dart';

part 'coupon_list_entity.g.dart';


@JsonSerializable()
class CouponListEntity extends Object {

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'pages')
  int pages;

  @JsonKey(name: 'limit')
  int limit;

  @JsonKey(name: 'page')
  int page;

  @JsonKey(name: 'listData')
  List<Coupon> listData;

  CouponListEntity(this.total,this.pages,this.limit,this.page,this.listData,);

  factory CouponListEntity.fromJson(Map<String, dynamic> srcJson) => _$CouponListEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CouponListEntityToJson(this);

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

  @JsonKey(name: 'min')
  String min;

  @JsonKey(name: 'discount')
  String discount;

  @JsonKey(name: 'startTime')
  String startTime;

  @JsonKey(name: 'endTime')
  String endTime;

  Coupon(this.id,this.name,this.desc,this.tag,this.min,this.discount,this.startTime,this.endTime,);

  factory Coupon.fromJson(Map<String, dynamic> srcJson) => _$CouponFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CouponToJson(this);

}


