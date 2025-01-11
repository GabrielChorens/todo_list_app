import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:todo_list_app/features/task_edition/ui/utils/utils.dart';
import 'package:todo_list_app/resources/l10n/l10n.dart';

class TitleFormField extends StatelessWidget {
  const TitleFormField({this.initialValue, super.key});
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: titleFieldName,
      initialValue: initialValue,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        labelText: context.l10n.title,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
