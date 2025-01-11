import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:todo_list_app/core/di/app_injection.dart';
import 'package:todo_list_app/core/shared/application/core_controller_cubit.dart';
import 'package:todo_list_app/features/home/domain/task.dart';
import 'package:todo_list_app/features/home/domain/value_objects/task_color.dart';

const titleFieldName = 'title';
const descriptionFieldName = 'description';
const scheduledDateTimeFieldName = 'scheduledDateTime';
const colorFieldName = 'color';
const enableNotificationFieldName = 'enableNotification';

extension Tasks on GlobalKey<FormBuilderState> {
  Task getTask({
    Task? previousTask,
    CoreControllerCubit? coreControllerCubit,
  }) {
    final title = _getFormFieldValue<String>(titleFieldName);
    final description = _getFormFieldValue<String?>(descriptionFieldName);
    final scheduledDateTime =
        _getFormFieldValue<DateTime?>(scheduledDateTimeFieldName);
    final color = _getFormFieldValue<TaskColor>(colorFieldName);
    final enableNotification =
        _getFormFieldValue<bool>(enableNotificationFieldName);

    if (previousTask != null) {
      return previousTask.copyWith(
        title: title,
        description: description,
        scheduledDateTime: scheduledDateTime,
        color: color,
        enableNotification: enableNotification,
      );
    } else {
      final user =
          (coreControllerCubit ?? getIt<CoreControllerCubit>()).state.user;
      if (user == null) {
        throw Exception('User not found when creating a task');
      }
      return Task.create(
        associatedUserId: user.id,
        title: title,
        description: description,
        scheduledDateTime: scheduledDateTime,
        color: color,
        enableNotification: enableNotification,
      );
    }
  }

  T _getFormFieldValue<T>(String fieldName) {
    return currentState?.fields[fieldName]?.value as T;
  }
}
