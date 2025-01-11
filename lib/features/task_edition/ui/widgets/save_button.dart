import 'package:flutter/material.dart';
import 'package:todo_list_app/resources/l10n/l10n.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({required this.onPressed, super.key});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
        Navigator.of(context).pop();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(context.l10n.save),
    );
  }
}
