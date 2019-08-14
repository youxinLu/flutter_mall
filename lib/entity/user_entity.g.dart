// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return UserEntity(
      json['userInfo'] == null
          ? null
          : UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
      json['token'] as String);
}

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{'userInfo': instance.userInfo, 'token': instance.token};

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo(json['nickName'] as String, json['avatarUrl'] as String);
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'nickName': instance.nickName,
      'avatarUrl': instance.avatarUrl
    };
