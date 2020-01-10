import 'package:json_annotation/json_annotation.dart';

part 'collect_entity.g.dart';


@JsonSerializable()
class CollectEntity extends Object {

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'pages')
  int pages;

  @JsonKey(name: 'limit')
  int limit;

  @JsonKey(name: 'page')
  int page;

  @JsonKey(name: 'list')
  List<ListData> list;

  CollectEntity(this.total,this.pages,this.limit,this.page,this.list,);

  factory CollectEntity.fromJson(Map<String, dynamic> srcJson) => _$CollectEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CollectEntityToJson(this);

}


@JsonSerializable()
class ListData extends Object {

  @JsonKey(name: 'brief')
  String brief;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'valueId')
  int valueId;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'retailPrice')
  double retailPrice;

  ListData(this.brief,this.picUrl,this.valueId,this.name,this.id,this.type,this.retailPrice,);

  factory ListData.fromJson(Map<String, dynamic> srcJson) => _$ListDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ListDataToJson(this);

}


