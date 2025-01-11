import 'package:flutter/material.dart';
import 'package:todo_list_app/core/shared/ui/extensions/extensions.dart';

class PinButton extends StatelessWidget {
  const PinButton({required this.onPressed, required this.isPinned, super.key});

  final VoidCallback onPressed;
  final bool isPinned;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      isSelected: isPinned,
      selectedIcon: const Icon(Icons.push_pin),
      iconSize: 20,
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          const CircleBorder(),
        ),
      ),
      color: context.colors.tertiary,
      icon: const Icon(Icons.push_pin_outlined),
      onPressed: onPressed,
    );
  }
}
