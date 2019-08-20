import 'package:json_annotation/json_annotation.dart';

part 'search_key_entity.g.dart';


@JsonSerializable()
class SearchKeyEntity extends Object {

  @JsonKey(name: 'keyword')
  List<String> keyword;

  SearchKeyEntity(this.keyword,);

  factory SearchKeyEntity.fromJson(Map<String, dynamic> srcJson) => _$SearchKeyEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SearchKeyEntityToJson(this);

}


