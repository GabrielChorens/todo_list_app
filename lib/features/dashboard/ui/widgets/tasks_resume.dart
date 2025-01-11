import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/core/di/app_injection.dart';
import 'package:todo_list_app/core/shared/application/core_controller_cubit.dart';
import 'package:todo_list_app/features/home/application/home_cubit.dart';
import 'package:todo_list_app/features/home/application/home_state.dart';
import 'package:todo_list_app/resources/l10n/l10n.dart';

class TasksResume extends StatelessWidget {
  const TasksResume({
    super.key,
    this.homeCubit,
    this.coreControllerCubit,
  });

  final HomeCubit? homeCubit;

  final CoreControllerCubit? coreControllerCubit;

  int? get userId =>
      (coreControllerCubit ?? getIt<CoreControllerCubit>()).state.user?.id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: homeCubit ?? getIt<HomeCubit>(),
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                context.l10n.taskResume,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  width: double.maxFinite,
                  child: _TaskResumeItem('Total', state.getTotalTasks(userId)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _TaskResumeItem(
                        context.l10n.completedTasks,
                        state.getCompletedTasks(userId),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _TaskResumeItem(
                        context.l10n.pendingTasks,
                        state.getPendingTasks(userId),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

extension on HomeState {
  int getTotalTasks(int? userId) {
    return tasks
        .where((task) => task.isErased == false && task.isOwner(userId))
        .length;
  }

  int getCompletedTasks(int? userId) {
    return tasks
        .where((task) => task.isCompleted && task.isOwner(userId))
        .length;
  }

  int getPendingTasks(int? userId) {
    return tasks
        .where(
          (task) => !task.isCompleted && !task.isErased && task.isOwner(userId),
        )
        .length;
  }
}

class _TaskResumeItem extends StatelessWidget {
  const _TaskResumeItem(this.title, this.value);

  final String title;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge?.apply(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            value.toString(),
            style: Theme.of(context).textTheme.titleSmall?.apply(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
        ],
      ),
    );
  }
}
