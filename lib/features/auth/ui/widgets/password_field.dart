import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:todo_list_app/resources/l10n/l10n.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
  });

  static String fieldName = 'password';

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.password,
        ),
        FormBuilderTextField(
          name: PasswordField.fieldName,
          obscureText: _obscureText,
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() => _obscureText = !_obscureText);
              },
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                size: 22,
              ),
            ),
          ),
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(),
            ],
          ),
        ),
      ],
    );
  }
}
