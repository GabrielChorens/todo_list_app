import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:todo_list_app/features/task_edition/ui/utils/utils.dart';
import 'package:todo_list_app/resources/l10n/l10n.dart';

class DescriptionFormField extends StatelessWidget {
  const DescriptionFormField({super.key, this.initialValue});

  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: FormBuilderTextField(
        name: descriptionFieldName,
        initialValue: initialValue,
        onTapOutside: (_) {
          FocusScope.of(context).unfocus();
        },
        textAlignVertical: TextAlignVertical.top,
        expands: true,
        maxLines: null,
        decoration: InputDecoration(
          labelText: context.l10n.description,
          labelStyle: const TextStyle(
            fontSize: 12,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
