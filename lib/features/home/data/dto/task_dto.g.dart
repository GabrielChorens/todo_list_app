// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskDtoImpl _$$TaskDtoImplFromJson(Map<String, dynamic> json) =>
    _$TaskDtoImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      associatedUserId: (json['userId'] as num).toInt(),
      description: json['description'] as String?,
      scheduledDateTime: const StringToDateTimeConverter()
          .fromJson(json['scheduledDateTime'] as String?),
      color: json['color'] as String?,
      isCompleted: json['completed'] as bool? ?? false,
      enableNotification: json['enableNotification'] as bool? ?? false,
      isPinned: json['isPinned'] as bool? ?? false,
    );

Map<String, dynamic> _$$TaskDtoImplToJson(_$TaskDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'userId': instance.associatedUserId,
      'description': instance.description,
      'scheduledDateTime':
          const StringToDateTimeConverter().toJson(instance.scheduledDateTime),
      'color': instance.color,
      'completed': instance.isCompleted,
      'enableNotification': instance.enableNotification,
      'isPinned': instance.isPinned,
    };
