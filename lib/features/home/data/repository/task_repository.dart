import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list_app/core/services/network_service/instances.dart';
import 'package:todo_list_app/core/services/network_service/network_service.dart';
import 'package:todo_list_app/core/services/task_storage_service/tasks_storage_service.dart';
import 'package:todo_list_app/core/shared/data/parsing_utils/json_parsers.dart';
import 'package:todo_list_app/features/home/data/dto/task_dto.dart';
import 'package:todo_list_app/features/home/domain/task.dart';

@injectable
class TaskRepository {
  TaskRepository(this._taskStorageService, this._jsonPlaceholderService);

  final TaskStorageService _taskStorageService;
  final JsonPlaceholderService _jsonPlaceholderService;

  IList<Task> getLocalTasks() => _taskStorageService.getTasks();
  Future<IList<Task>> syncFetch(IList<Task> tasks) async {
    final onlineTasks = await _jsonPlaceholderService.fetch(
      '/todos',
      method: DioRequestMethod.get,
      successDataParser: (object) {
        return IMap.fromIterable(
          object.parseToList().map(
                (element) => TaskDto.fromJson(element as Map<String, dynamic>)
                    .toDomain(),
              ),
          keyMapper: (task) => task.id,
          valueMapper: (task) => task,
        );
      },
    );
    return onlineTasks.fold(
      (failure) => tasks,
      (onlineTasks) {
        //This operation ensures that local tasks take precedence over online tasks
        //since JSONPlaceholder always returns the same tasks and we want to keep the local changes

        //Consider moving this operation to an Isolate
        final updatedTasks = tasks
            .fold<IMap<int, Task>>(
              onlineTasks,
              (map, task) => map.add(task.id, task),
            )
            .values
            .toIList();
        _taskStorageService.writeTasks(updatedTasks);
        return updatedTasks;
      },
    );
  }

  void writeTasks(IList<Task> tasks) {
    _taskStorageService.writeTasks(tasks);
  }
}
