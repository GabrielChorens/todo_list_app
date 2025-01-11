import 'package:flutter/material.dart';
import 'package:todo_list_app/core/shared/ui/extensions/extensions.dart';

class CollaboratingButton extends StatelessWidget {
  const CollaboratingButton({
    required this.onPressed,
    required this.isCollaboratingActive,
    super.key,
  });

  final VoidCallback onPressed;
  final bool isCollaboratingActive;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.people_alt_outlined),
      selectedIcon: const Icon(Icons.people_alt),
      isSelected: isCollaboratingActive,
      style: ButtonStyle(
        foregroundColor:
            WidgetStateProperty.all<Color>(context.colors.secondary),
      ),
      onPressed: onPressed,
    );
  }
}
