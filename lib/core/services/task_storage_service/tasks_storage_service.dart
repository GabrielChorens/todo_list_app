import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list_app/features/home/data/dto/task_dto.dart';
import 'package:todo_list_app/features/home/domain/task.dart';

const _tasksKey = 'tasks';

@injectable
class TaskStorageService {
  TaskStorageService(this._getStorage);

  final GetStorage _getStorage;

  IList<Task> getTasks() {
    final tasks = _getStorage.read<List<dynamic>>(_tasksKey) ?? [];
    return tasks
        .map(
          (element) =>
              TaskDto.fromJson(element as Map<String, dynamic>).toDomain(),
        )
        .toIList();
  }

  void writeTasks(IList<Task> tasks) {
    _getStorage.write(
      _tasksKey,
      tasks.map((element) => TaskDto.fromDomain(element).toJson()).toList(),
    );
  }

  void clearTasks() {
    _getStorage.remove(_tasksKey);
  }
}
