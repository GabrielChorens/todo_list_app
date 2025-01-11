import 'package:flutter/material.dart';
import 'package:todo_list_app/core/utils/extensions/context_extensions.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    required this.text,
    required this.onPressed,
    super.key,
  });
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(context.width / 1.5, 50),
      ),
      child: Text(text),
    );
  }
}
