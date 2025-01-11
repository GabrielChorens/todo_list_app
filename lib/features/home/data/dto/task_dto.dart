import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list_app/core/shared/data/parsing_utils/json_parsers.dart';
import 'package:todo_list_app/features/home/domain/task.dart';
import 'package:todo_list_app/features/home/domain/value_objects/task_color.dart';

part 'task_dto.freezed.dart';
part 'task_dto.g.dart';

@freezed
class TaskDto with _$TaskDto {
  factory TaskDto({
    required int id,
    required String title,
    @JsonKey(name: 'userId') required int associatedUserId,
    String? description,
    @StringToDateTimeConverter() DateTime? scheduledDateTime,
    String? color,
    @JsonKey(name: 'completed') @Default(false) bool isCompleted,
    @Default(false) bool enableNotification,
    @Default(false) bool isPinned,
  }) = _TaskDto;

  const TaskDto._();

  factory TaskDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);

  factory TaskDto.fromDomain(Task task) {
    return TaskDto(
      associatedUserId: task.associatedUserId,
      id: task.id,
      title: task.title,
      description: task.description,
      scheduledDateTime: task.scheduledDateTime,
      color: task.color?.toJson(),
      isCompleted: task.isCompleted,
      enableNotification: task.enableNotification,
      isPinned: task.isPinned,
    );
  }

  Task toDomain() {
    return Task(
      associatedUserId: associatedUserId,
      id: id,
      title: title,
      description: description,
      scheduledDateTime: scheduledDateTime,
      color: color != null ? TaskColor.fromJson(color!) : null,
      isCompleted: isCompleted,
      enableNotification: enableNotification,
      isPinned: isPinned,
    );
  }
}
