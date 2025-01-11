import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:todo_list_app/features/task_edition/ui/utils/utils.dart';
import 'package:todo_list_app/resources/l10n/l10n.dart';

class ScheduledDateFormField extends StatelessWidget {
  const ScheduledDateFormField({super.key, this.initialValue});

  final DateTime? initialValue;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.5,
      child: FormBuilderDateTimePicker(
        name: scheduledDateTimeFieldName,
        initialDate: initialValue,
        timePickerInitialEntryMode: TimePickerEntryMode.input,
        decoration: InputDecoration(
          labelText: context.l10n.date,
          labelStyle: const TextStyle(
            fontSize: 12,
          ),
          border: const UnderlineInputBorder(),
        ),
      ),
    );
  }
}
