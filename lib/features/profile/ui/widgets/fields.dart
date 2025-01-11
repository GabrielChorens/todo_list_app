import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:todo_list_app/resources/l10n/l10n.dart';

class NameField extends StatelessWidget {
  const NameField({super.key, this.initialValue});

  static String fieldName = 'name';
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return _Field(context.l10n.name, NameField.fieldName, initialValue);
  }
}

class LastNameField extends StatelessWidget {
  const LastNameField({super.key, this.initialValue});

  static String fieldName = 'lastName';
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return _Field(context.l10n.lastName, LastNameField.fieldName, initialValue);
  }
}

class _Field extends StatelessWidget {
  const _Field(this.label, this.name, this.initialValue);

  final String label;
  final String name;

  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        FormBuilderTextField(
          initialValue: initialValue,
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
          },
          name: name,
          decoration: const InputDecoration(
            errorMaxLines: 2,
          ),
        ),
      ],
    );
  }
}
