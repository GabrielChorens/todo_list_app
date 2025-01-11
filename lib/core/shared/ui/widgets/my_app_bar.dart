import 'package:flutter/material.dart';
import 'package:todo_list_app/core/shared/ui/widgets/back_button.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({required String title, super.key}) : _title = title;

  final String _title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      foregroundColor: Theme.of(context).colorScheme.onSecondary,
      leading: const MyBackButton(),
      shadowColor: Theme.of(context).colorScheme.secondary,
      elevation: 2,
      title: Text(
        _title,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(58);
}
