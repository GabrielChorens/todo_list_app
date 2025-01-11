import 'package:flutter/material.dart';
import 'package:todo_list_app/core/shared/ui/extensions/extensions.dart';

class CompleteButton extends StatelessWidget {
  const CompleteButton({required this.onPressed, super.key});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final color = context.colors.secondary;
    return SizedBox(
      width: 30,
      child: IconButton(
        icon: const Icon(Icons.check),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(color),
          shape: WidgetStateProperty.all(
            CircleBorder(
              side: BorderSide(
                color: color,
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
