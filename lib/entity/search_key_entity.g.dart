// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_key_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchKeyEntity _$SearchKeyEntityFromJson(Map<String, dynamic> json) {
  return SearchKeyEntity(
      (json['keyword'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$SearchKeyEntityToJson(SearchKeyEntity instance) =>
    <String, dynamic>{'keyword': instance.keyword};
