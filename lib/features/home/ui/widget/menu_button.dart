import 'package:flutter/material.dart';
import 'package:todo_list_app/core/shared/ui/extensions/extensions.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key, this.onPressed});

  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu),
      color: context.colors.onPrimary,
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}
