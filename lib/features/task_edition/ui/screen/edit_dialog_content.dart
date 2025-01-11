import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:todo_list_app/core/di/app_injection.dart';
import 'package:todo_list_app/features/home/application/home_cubit.dart';
import 'package:todo_list_app/features/home/domain/task.dart';
import 'package:todo_list_app/features/home/domain/value_objects/task_color.dart';
import 'package:todo_list_app/features/task_edition/ui/utils/utils.dart';
import 'package:todo_list_app/features/task_edition/ui/widgets/custom_color_picker.dart';
import 'package:todo_list_app/features/task_edition/ui/widgets/description_form_field.dart';
import 'package:todo_list_app/features/task_edition/ui/widgets/enable_notification_switch_form_field.dart';
import 'package:todo_list_app/features/task_edition/ui/widgets/save_button.dart';
import 'package:todo_list_app/features/task_edition/ui/widgets/scheduled_date_form_field.dart';
import 'package:todo_list_app/features/task_edition/ui/widgets/title_form_field.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key, Task? task}) : _task = task;

  final Task? _task;
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: FormBuilder(
        key: _formKey,
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 15,
          children: <Widget>[
            TitleFormField(
              initialValue: widget._task?.title,
            ),
            DescriptionFormField(
              initialValue: widget._task?.description,
            ),
            ScheduledDateFormField(
              initialValue: widget._task?.scheduledDateTime,
            ),
            CustomColorPicker(
              initialValue: widget._task?.color ?? TaskColor.white,
            ),
            EnableNotificationSwitchFormField(
              initialValue: widget._task?.enableNotification ?? true,
            ),
            SaveButton(
              onPressed: () {
                if (_formKey.currentState!.saveAndValidate()) {
                  final task = _formKey.getTask(
                    previousTask: widget._task,
                  );
                  if (widget._task != null) {
                    getIt<HomeCubit>().updateTask(task);
                  } else {
                    getIt<HomeCubit>().addTask(task);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
