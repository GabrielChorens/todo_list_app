import 'package:flutter/material.dart';
import 'package:todo_list_app/core/shared/ui/extensions/extensions.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    required this.onPressed,
    required this.isFilterActive,
    super.key,
  });

  final VoidCallback onPressed;
  final bool isFilterActive;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.filter_alt_off_outlined),
      selectedIcon: const Icon(Icons.filter_alt_rounded),
      isSelected: isFilterActive,
      style: ButtonStyle(
        foregroundColor:
            WidgetStateProperty.all<Color>(context.colors.secondary),
      ),
      onPressed: onPressed,
    );
  }
}
