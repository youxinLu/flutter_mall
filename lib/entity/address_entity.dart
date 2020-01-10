import 'package:json_annotation/json_annotation.dart';

part 'address_entity.g.dart';


@JsonSerializable()
class AddressEntity extends Object {

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

  AddressEntity(this.total,this.pages,this.limit,this.page,this.list,);

  factory AddressEntity.fromJson(Map<String, dynamic> srcJson) => _$AddressEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AddressEntityToJson(this);

}


@JsonSerializable()
class ListData extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'province')
  String province;

  @JsonKey(name: 'city')
  String city;

  @JsonKey(name: 'county')
  String county;

  @JsonKey(name: 'addressDetail')
  String addressDetail;

  @JsonKey(name: 'areaCode')
  String areaCode;

  @JsonKey(name: 'tel')
  String tel;

  @JsonKey(name: 'isDefault')
  bool isDefault;

  @JsonKey(name: 'addTime')
  String addTime;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'deleted')
  bool deleted;

  ListData(this.id,this.name,this.userId,this.province,this.city,this.county,this.addressDetail,this.areaCode,this.tel,this.isDefault,this.addTime,this.updateTime,this.deleted,);

  factory ListData.fromJson(Map<String, dynamic> srcJson) => _$ListDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ListDataToJson(this);

}


