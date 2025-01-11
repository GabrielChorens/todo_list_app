import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list_app/features/home/domain/task.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(IList<Task>.empty()) IList<Task> tasks,
    @Default(false) bool isLoading,
  }) = _HomeState;
}
