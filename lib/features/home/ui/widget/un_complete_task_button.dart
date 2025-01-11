import 'package:flutter/material.dart';
import 'package:todo_list_app/core/shared/ui/extensions/extensions.dart';

class UnCompleteTaskButton extends StatelessWidget {
  const UnCompleteTaskButton({required this.onPressed, super.key});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      child: IconButton(
        icon: const Icon(Icons.refresh),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(
            context.colors.secondary,
          ),
          shape: WidgetStateProperty.all(
            CircleBorder(
              side: BorderSide(
                color: context.colors.secondary,
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
