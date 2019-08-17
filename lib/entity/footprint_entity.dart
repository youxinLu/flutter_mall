import 'package:json_annotation/json_annotation.dart';

part 'footprint_entity.g.dart';


@JsonSerializable()
class FootprintEntity extends Object {

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'pages')
  int pages;

  @JsonKey(name: 'limit')
  int limit;

  @JsonKey(name: 'page')
  int page;

  @JsonKey(name: 'listData')
  List<Footprint> listData;

  FootprintEntity(this.total,this.pages,this.limit,this.page,this.listData,);

  factory FootprintEntity.fromJson(Map<String, dynamic> srcJson) => _$FootprintEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FootprintEntityToJson(this);

}


@JsonSerializable()
class Footprint extends Object {

  @JsonKey(name: 'brief')
  String brief;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'addTime')
  String addTime;

  @JsonKey(name: 'goodsId')
  int goodsId;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'retailPrice')
  double retailPrice;

  Footprint(this.brief,this.picUrl,this.addTime,this.goodsId,this.name,this.id,this.retailPrice,);

  factory Footprint.fromJson(Map<String, dynamic> srcJson) => _$FootprintFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FootprintToJson(this);

}


