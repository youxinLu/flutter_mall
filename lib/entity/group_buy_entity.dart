import 'package:json_annotation/json_annotation.dart';

part 'group_buy_entity.g.dart';
class GroupBuyListEntity {
  List<GroupBuyEntity> groupBuyEntitys;

  GroupBuyListEntity(this.groupBuyEntitys);

  factory GroupBuyListEntity.fromJson(List<dynamic> parseJson) {
    List<GroupBuyEntity> groupBuyEntitys;
    groupBuyEntitys = parseJson.map((i) => GroupBuyEntity.fromJson(i)).toList();
    return GroupBuyListEntity(groupBuyEntitys);
  }
}

@JsonSerializable()
class GroupBuyEntity extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'brief')
  String brief;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'counterPrice')
  double counterPrice;

  @JsonKey(name: 'retailPrice')
  double retailPrice;

  @JsonKey(name: 'grouponPrice')
  double grouponPrice;

  @JsonKey(name: 'grouponDiscount')
  int grouponDiscount;

  @JsonKey(name: 'grouponMember')
  int grouponMember;

  GroupBuyEntity(this.id,this.name,this.brief,this.picUrl,this.counterPrice,this.retailPrice,this.grouponPrice,this.grouponDiscount,this.grouponMember,);

  factory GroupBuyEntity.fromJson(Map<String, dynamic> srcJson) => _$GroupBuyEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GroupBuyEntityToJson(this);

}


