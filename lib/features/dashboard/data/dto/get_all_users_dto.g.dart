// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_users_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetAllUsersDtoImpl _$$GetAllUsersDtoImplFromJson(Map<String, dynamic> json) =>
    _$GetAllUsersDtoImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => UserDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetAllUsersDtoImplToJson(
        _$GetAllUsersDtoImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
