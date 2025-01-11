import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key, this.initialValue});

  static String fieldName = 'email';

  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Email'),
        FormBuilderTextField(
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
          },
          initialValue: initialValue,
          name: EmailField.fieldName,
          decoration: const InputDecoration(
            errorMaxLines: 2,
          ),
          keyboardType: TextInputType.emailAddress,
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ],
          ),
        ),
      ],
    );
  }
}
