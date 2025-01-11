import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart' as fpdart;
import 'package:mocktail/mocktail.dart';
import 'package:todo_list_app/core/exceptions/app_exceptions.dart';
import 'package:todo_list_app/core/services/network_service/instances.dart';
import 'package:todo_list_app/core/services/network_service/network_service.dart';
import 'package:todo_list_app/core/services/task_storage_service/tasks_storage_service.dart';
import 'package:todo_list_app/features/home/data/repository/task_repository.dart';
import 'package:todo_list_app/features/home/domain/task.dart';

class MockTaskStorageService extends Mock implements TaskStorageService {}

class MockJsonPlaceholderService extends Mock
    implements JsonPlaceholderService {}

void main() {
  late TaskRepository taskRepository;
  late MockTaskStorageService mockTaskStorageService;
  late MockJsonPlaceholderService mockJsonPlaceholderService;

  setUp(() {
    mockTaskStorageService = MockTaskStorageService();
    mockJsonPlaceholderService = MockJsonPlaceholderService();
    taskRepository =
        TaskRepository(mockTaskStorageService, mockJsonPlaceholderService);
  });

  setUpAll(() {
    registerFallbackValue(Uri());
    registerFallbackValue(DioRequestMethod.get);
    registerFallbackValue(<String, dynamic>{});
  });

  group('TaskRepository', () {
    test('getLocalTasks returns tasks from storage', () {
      final tasks = [
        Task(
          id: 1,
          title: 'Test Task',
          associatedUserId: 1,
        ),
      ].toIList();
      when(() => mockTaskStorageService.getTasks()).thenReturn(tasks);

      final result = taskRepository.getLocalTasks();

      expect(result, tasks);
    });

    test('syncFetch success', () async {
      final localTasks =
          [Task(id: 1, title: 'Local Task', associatedUserId: 1)].toIList();
      final onlineTasks =
          [Task(id: 2, title: 'Online Task', associatedUserId: 1)].toIList();
      when(
        () => mockJsonPlaceholderService.fetch<IMap<int, Task>>(
          any(),
          method: any(named: 'method'),
          successDataParser: any(named: 'successDataParser'),
        ),
      ).thenAnswer(
        (_) async => fpdart.right(
          IMap.fromEntries(
            onlineTasks.map((task) => MapEntry(task.id, task)),
          ),
        ),
      );
      final result = await taskRepository.syncFetch(localTasks);

      expect(result.length, 2);
      expect(result.contains(localTasks.first), true);
      expect(result.contains(onlineTasks.first), true);
    });

    test('syncFetch failure', () async {
      final localTasks =
          [Task(id: 1, title: 'Local Task', associatedUserId: 1)].toIList();
      when(
        () => mockJsonPlaceholderService.fetch<IMap<int, Task>>(
          any(),
          method: any(named: 'method'),
          successDataParser: any(named: 'successDataParser'),
        ),
      ).thenAnswer((_) async => fpdart.left(const UnknownError()));

      final result = await taskRepository.syncFetch(localTasks);

      expect(result, localTasks);
    });

    test('writeTasks writes tasks to storage', () {
      final tasks =
          [Task(id: 1, title: 'Test Task', associatedUserId: 1)].toIList();
      when(() => mockTaskStorageService.writeTasks(tasks)).thenReturn(null);

      taskRepository.writeTasks(tasks);

      verify(() => mockTaskStorageService.writeTasks(tasks)).called(1);
    });
  });
}
