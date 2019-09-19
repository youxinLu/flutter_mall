import 'package:json_annotation/json_annotation.dart';

part 'project_selection_recommed_entity.g.dart';


@JsonSerializable()
class ProjectSelectionRecommedEntity extends Object {

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'pages')
  int pages;

  @JsonKey(name: 'list')
  List<Recommed> recommed;

  @JsonKey(name: 'limit')
  int limit;

  @JsonKey(name: 'page')
  int page;

  ProjectSelectionRecommedEntity(this.total,this.pages,this.recommed,this.limit,this.page,);

  factory ProjectSelectionRecommedEntity.fromJson(Map<String, dynamic> srcJson) => _$ProjectSelectionRecommedEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProjectSelectionRecommedEntityToJson(this);

}


@JsonSerializable()
class Recommed extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'subtitle')
  String subtitle;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'readCount')
  String readCount;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'sortOrder')
  int sortOrder;

  @JsonKey(name: 'goods')
  List<dynamic> goods;

  @JsonKey(name: 'addTime')
  String addTime;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'deleted')
  bool deleted;

  @JsonKey(name: 'content')
  String content;

  Recommed(this.id,this.title,this.subtitle,this.price,this.readCount,this.picUrl,this.sortOrder,this.goods,this.addTime,this.updateTime,this.deleted,this.content,);

  factory Recommed.fromJson(Map<String, dynamic> srcJson) => _$RecommedFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RecommedToJson(this);

}


