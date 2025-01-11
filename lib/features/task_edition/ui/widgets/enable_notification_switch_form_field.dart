import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:todo_list_app/features/task_edition/ui/utils/utils.dart';
import 'package:todo_list_app/resources/l10n/l10n.dart';

class EnableNotificationSwitchFormField extends StatelessWidget {
  const EnableNotificationSwitchFormField({
    required this.initialValue,
    super.key,
  });

  final bool initialValue;

  @override
  Widget build(BuildContext context) {
    return FormBuilderSwitch(
      name: enableNotificationFieldName,
      initialValue: initialValue,
      title: Text(
        context.l10n.enableNotifications,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
    );
  }
}
