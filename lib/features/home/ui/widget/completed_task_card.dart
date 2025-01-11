import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/core/shared/ui/extensions/extensions.dart';
import 'package:todo_list_app/features/home/application/home_cubit.dart';
import 'package:todo_list_app/features/home/domain/task.dart';
import 'package:todo_list_app/features/home/ui/widget/not_owner_indicator.dart';
import 'package:todo_list_app/features/home/ui/widget/trash_button.dart';
import 'package:todo_list_app/features/home/ui/widget/un_complete_task_button.dart';

class CompletedTaskCard extends StatelessWidget {
  const CompletedTaskCard({required this.task, super.key, this.isOwner = true});

  final Task task;

  final bool isOwner;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
        titleAlignment: ListTileTitleAlignment.center,
        tileColor: task.color?.color,
        leading: TrashButton(
          onPressed: () {
            context.read<HomeCubit>().removeTask(task.id);
          },
        ),
        title: Text(
          task.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.lineThrough,
            color: Colors.black,
          ),
        ),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (task.description != null && task.description!.isNotEmpty)
              Text(
                task.description!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.lineThrough,
                ),
              )
            else
              const SizedBox(),
            if (task.scheduledDateTime != null)
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                ),
                child: Text(
                  task.scheduledDateTime!.toFormattedString(context),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: task.scheduledDateTime?.isBefore(DateTime.now()) ??
                            false
                        ? Colors.red
                        : Colors.black,
                  ),
                ),
              )
            else
              const SizedBox(),
          ],
        ),
        // isThreeLine: true,
        trailing: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: isOwner
              ? UnCompleteTaskButton(
                  onPressed: () {
                    context.read<HomeCubit>().unCompleteTask(task.id);
                  },
                )
              : const NotOwnerIndicator(),
        ),
      ),
    );
  }
}
