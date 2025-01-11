import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/core/di/app_injection.dart';
import 'package:todo_list_app/core/shared/application/core_controller_cubit.dart';
import 'package:todo_list_app/features/home/domain/task.dart';
import 'package:todo_list_app/features/home/ui/widget/collaboration_button.dart';
import 'package:todo_list_app/features/home/ui/widget/completed_task_card.dart';
import 'package:todo_list_app/features/home/ui/widget/filter_button.dart';
import 'package:todo_list_app/features/home/ui/widget/task_card.dart';
import 'package:todo_list_app/resources/l10n/l10n.dart';

class TaskList extends StatefulWidget {
  const TaskList({required this.tasks, super.key, this.coreControllerCubit});

  final IList<Task> tasks;
  final CoreControllerCubit? coreControllerCubit;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final TextEditingController _textEditingController = TextEditingController();
  bool isShowingOnlyPending = true;
  bool isCollaborationMode = false;
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  CoreControllerCubit get coreControllerCubit =>
      widget.coreControllerCubit ?? getIt<CoreControllerCubit>();

  bool isOwner(Task task) => task.isOwner(coreControllerCubit.state.user?.id);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          floating: true,
          pinned: true,
          delegate: _SearchBarDelegate(
            minHeight: 60,
            maxHeight: 60,
            child: ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        onTapOutside: (_) {
                          FocusScope.of(context).unfocus();
                        },
                        focusNode: FocusNode(),
                        controller: _textEditingController,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: context.l10n.searchByTitle,
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: const Icon(Icons.search),
                        ),
                        onChanged: (value) {
                          // Handle search logic here
                        },
                      ),
                    ),
                  ),
                  FilterButton(
                    onPressed: () {
                      setState(() {
                        isShowingOnlyPending = !isShowingOnlyPending;
                      });
                    },
                    isFilterActive: isShowingOnlyPending,
                  ),
                  const SizedBox(width: 8),
                  CollaboratingButton(
                    onPressed: () {
                      setState(() {
                        isCollaborationMode = !isCollaborationMode;
                      });
                    },
                    isCollaboratingActive: isCollaborationMode,
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverList.builder(
          itemCount: widget.tasks.length,
          itemBuilder: (context, index) {
            final task = widget.tasks[index];
            return _TaskHandler(
              hide: (task.isCompleted && isShowingOnlyPending) ||
                  (!isCollaborationMode && !isOwner(task)) ||
                  task.isErased,
              isCompleted: task.isCompleted,
              isOwner: isOwner(task),
              task: task,
              textEditingController: _textEditingController,
            );
          },
        ),
      ],
    );
  }
}

class _TaskHandler extends StatelessWidget {
  const _TaskHandler({
    required this.hide,
    required this.isCompleted,
    required this.isOwner,
    required this.task,
    required this.textEditingController,
  });

  final bool hide;
  final bool isCompleted;
  final bool isOwner;
  final Task task;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    if (hide) {
      return const SizedBox();
    }
    return _Task(
      isCompleted: isCompleted,
      isOwner: isOwner,
      task: task,
      textEditingController: textEditingController,
    );
  }
}

class _Task extends StatelessWidget {
  const _Task({
    required this.isCompleted,
    required this.isOwner,
    required this.task,
    required this.textEditingController,
  });

  final bool isCompleted;
  final bool isOwner;
  final Task task;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: textEditingController,
      builder: (context, child) {
        return task.title.toLowerCase().contains(
                  textEditingController.text.toLowerCase(),
                )
            ? isCompleted
                ? CompletedTaskCard(
                    task: task,
                    isOwner: isOwner,
                  )
                : TaskCard(
                    task: task,
                    isOwner: isOwner,
                  )
            : const SizedBox();
      },
    );
  }
}

class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  _SearchBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SearchBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
