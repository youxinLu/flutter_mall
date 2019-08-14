import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';


@JsonSerializable()
class UserEntity extends Object {

  @JsonKey(name: 'userInfo')
  UserInfo userInfo;

  @JsonKey(name: 'token')
  String token;

  UserEntity(this.userInfo,this.token,);


  factory UserEntity.fromJson(Map<String, dynamic> srcJson) => _$UserEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

}


@JsonSerializable()
class UserInfo extends Object {

  @JsonKey(name: 'nickName')
  String nickName;

  @JsonKey(name: 'avatarUrl')
  String avatarUrl;

  UserInfo(this.nickName,this.avatarUrl,);

  factory UserInfo.fromJson(Map<String, dynamic> srcJson) => _$UserInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

}


