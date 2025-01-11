import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list_app/features/home/domain/value_objects/task_color.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  factory Task({
    required int associatedUserId,
    required int id,
    required String title,
    String? description,
    DateTime? scheduledDateTime,
    TaskColor? color,
    @Default(false) bool isCompleted,
    // This value may seem confusing, but since the task is not deleted from the database, we
    // need to keep track of whether it was erased or not. So, when the user erases a task,
    // and then poll the database we don't want to show the erased task.
    @Default(false) bool isErased,
    @Default(false) bool enableNotification,
    @Default(false) bool isPinned,
  }) = _Task;

  const Task._();

  factory Task.create({
    required int associatedUserId,
    required String title,
    String? description,
    DateTime? scheduledDateTime,
    TaskColor? color,
    bool isErased = false,
    bool isCompleted = false,
    bool enableNotification = false,
    bool isPinned = false,
  }) {
    //Since back todos have a maximum 200 ids.
    final id = Random.secure().nextInt(10000) + 200;
    return Task(
      associatedUserId: associatedUserId,
      id: id,
      title: title,
      description: description,
      scheduledDateTime: scheduledDateTime,
      color: color,
      isErased: isErased,
      isCompleted: isCompleted,
      enableNotification: enableNotification,
      isPinned: isPinned,
    );
  }
  bool isOwner(int? userId) => associatedUserId == userId;
}
