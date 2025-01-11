import 'dart:async';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list_app/features/home/application/home_state.dart';
import 'package:todo_list_app/features/home/data/repository/task_repository.dart';
import 'package:todo_list_app/features/home/domain/task.dart';
import 'package:todo_list_app/features/notifications/application/notification_service.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._taskRepository) : super(const HomeState());

  final TaskRepository _taskRepository;
  LocalNotificationService? notificationService;

  Timer? _syncTimer;

  void initialize({LocalNotificationService? service}) {
    if (notificationService == null) {
      if (service != null) {
        notificationService = service;
      } else {
        LocalNotificationService.create()
            .then((value) => notificationService = value);
      }
      emit(
        state.copyWith(
          tasks: _taskRepository.getLocalTasks().sortedByPinnedStatus,
        ),
      );
      syncTasks(
        emitLoading: true,
      ).then((_) => startSyncTimer());
    }
  }

  void stopSubscriptions() {
    _syncTimer?.cancel();
  }

  void startSyncTimer() {
    _syncTimer?.cancel();
    _syncTimer = Timer.periodic(const Duration(minutes: 3), (_) {
      syncTasks();
    });
  }

  Future<void> syncTasks({
    bool emitLoading = false,
  }) async {
    if (emitLoading) {
      emit(state.copyWith(isLoading: true));
    }
    final tasks = await _taskRepository.syncFetch(state.tasks);
    emit(state.copyWith(tasks: tasks.sortedByPinnedStatus, isLoading: false));
  }

  Future<void> addTask(Task task) async {
    emit(state.copyWith(isLoading: true));
    final tasks = state.tasks.add(task);
    unawaited(_updateTasks(tasks));

    tryToScheduleNotification(task);
  }

  void removeTask(int id) {
    _updateTaskStatus(id, (task) => task.copyWith(isErased: true));
    cancelNotification(id);
  }

  void updateTask(Task task) {
    final tasks = state.tasks.map((e) => e.id == task.id ? task : e).toIList();
    _updateTasks(tasks);
    tryToScheduleNotification(task);
  }

  void pinTask(int id) {
    final tasks = state.tasks
        .map((task) =>
            task.id == id ? task.copyWith(isPinned: !task.isPinned) : task)
        .toIList();
    _taskRepository.writeTasks(tasks);
    emit(state.copyWith(tasks: tasks.sortedByPinnedStatus, isLoading: false));
  }

  void completeTask(int id) {
    _updateTaskStatus(
      id,
      (task) => task.copyWith(isCompleted: !task.isCompleted, isPinned: false),
    );
    cancelNotification(id);
  }

  void unCompleteTask(int id) {
    _updateTaskStatus(id, (task) => task.copyWith(isCompleted: false));
    tryToScheduleNotification(state.tasks.firstWhere((task) => task.id == id));
  }

  void _updateTaskStatus(int id, Task Function(Task) update) {
    final tasks = state.tasks
        .map((task) => task.id == id ? update(task) : task)
        .toIList();
    _updateTasks(tasks);
  }

  Future<void> _updateTasks(IList<Task> tasks) async {
    _taskRepository.writeTasks(tasks);
    emit(state.copyWith(tasks: tasks, isLoading: false));
  }

  void tryToScheduleNotification(Task task) {
    if (task.scheduledDateTime != null &&
        task.scheduledDateTime!.isAfter(DateTime.now())) {
      notificationService?.scheduleNotification(
        id: task.id,
        title: task.title,
        body: task.description,
        scheduledDate: task.scheduledDateTime!,
      );
    }
  }

  void cancelNotification(int id) {
    notificationService?.cancelNotification(id);
  }

  @override
  Future<void> close() {
    _syncTimer?.cancel();
    return super.close();
  }
}

extension on IList<Task> {
  IList<Task> get sortedByPinnedStatus {
    final pinnedTasks = where((task) => task.isPinned).toIList();
    final unpinnedTasks = where((task) => !task.isPinned).toIList();
    return pinnedTasks + unpinnedTasks;
  }
}
