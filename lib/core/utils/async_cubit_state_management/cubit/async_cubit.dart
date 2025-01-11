import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/core/utils/async_cubit_state_management/async_cubit_state_management.dart';

///Async cubit its an implementation of cubit to handle async states.
///
///Its in a way a resemblance of AsyncValue from Riverpod in an attempt to make
///more consistent and straightforward the way we handle async request usually
///to an API.
///
/// The cubit has a generic type `L` that represents the Error type and `R` that
/// represents the Success type.
///
/// See also:
/// - [AsyncState]
abstract class AsyncCubit<L, R> extends Cubit<AsyncState<L, R>> {
  AsyncCubit(super.initialState);
}
