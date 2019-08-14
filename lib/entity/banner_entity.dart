import 'package:json_annotation/json_annotation.dart';

part 'banner_entity.g.dart';

class BannerListEntity {
  List<BannerEntity> bannerEntitys;

  BannerListEntity(this.bannerEntitys);

  factory BannerListEntity.fromJson(List<dynamic> parsedJson) {
    List<BannerEntity> bannerEntityList;
    bannerEntityList = parsedJson.map((i) => BannerEntity.fromJson(i)).toList();
    return BannerListEntity(bannerEntityList);
  }
}

@JsonSerializable()
class BannerEntity extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'position')
  int position;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'enabled')
  bool enabled;

  @JsonKey(name: 'addTime')
  String addTime;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'deleted')
  bool deleted;

  BannerEntity(
    this.id,
    this.name,
    this.link,
    this.url,
    this.position,
    this.content,
    this.enabled,
    this.addTime,
    this.updateTime,
    this.deleted,
  );

  factory BannerEntity.fromJson(Map<String, dynamic> srcJson) =>
      _$BannerEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannerEntityToJson(this);
}
