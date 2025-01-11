import 'package:flutter/material.dart';
import 'package:todo_list_app/core/shared/ui/extensions/extensions.dart';

class TrashButton extends StatelessWidget {
  const TrashButton({required this.onPressed, super.key});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      child: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(
            context.colors.tertiary,
          ),
          shape: WidgetStateProperty.all(
            CircleBorder(
              side: BorderSide(
                color: context.colors.tertiary,
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
