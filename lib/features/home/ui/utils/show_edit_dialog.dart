import 'package:flutter/material.dart';
import 'package:todo_list_app/features/home/domain/task.dart';
import 'package:todo_list_app/features/task_edition/ui/screen/edit_dialog_content.dart';

extension EditDialog on BuildContext {
  Future<void> showEditDialog({
    Task? task,
  }) {
    return showModalBottomSheet<void>(
      context: this,
      isScrollControlled: true,
      builder: (context) => task == null
          ? const EditScreen()
          : EditScreen(
              task: task,
            ),
    );
  }
}
