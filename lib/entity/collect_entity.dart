import 'package:json_annotation/json_annotation.dart';

part 'collect_entity.g.dart';


@JsonSerializable()
class CollectEntity extends Object {

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'pages')
  int pages;

  @JsonKey(name: 'listData')
  List<Collect> listData;

  @JsonKey(name: 'limit')
  int limit;

  @JsonKey(name: 'page')
  int page;

  CollectEntity(this.total,this.pages,this.listData,this.limit,this.page,);

  factory CollectEntity.fromJson(Map<String, dynamic> srcJson) => _$CollectEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CollectEntityToJson(this);

}


@JsonSerializable()
class Collect extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'bried')
  String bried;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'valueId')
  int valueId;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'retailPrice')
  double retailPrice;

  Collect (this.id,this.type,this.bried,this.picUrl,this.valueId,this.name,this.retailPrice,);

  factory Collect.fromJson(Map<String, dynamic> srcJson) => _$CollectFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CollectToJson(this);

}


