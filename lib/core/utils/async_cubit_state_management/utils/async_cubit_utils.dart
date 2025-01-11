import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/core/utils/async_cubit_state_management/async_cubit_state_management.dart';

///BlocConsumer applied to AsyncCubit
class AsyncBlocConsumer<B extends AsyncCubit<L, R>, L, R>
    extends BlocConsumer<B, AsyncState<L, R>> {
  const AsyncBlocConsumer({
    required super.builder,
    required super.listener,
    super.key,
    super.bloc,
    super.buildWhen,
    super.listenWhen,
  });
}

///BlocListener applied to AsyncCubit
class AsyncBlocListener<B extends AsyncCubit<L, R>, L, R>
    extends BlocListener<B, AsyncState<L, R>> {
  const AsyncBlocListener({
    required super.listener,
    super.key,
    super.bloc,
    super.listenWhen,
    super.child,
  });
}

///BlocBuilder applied to AsyncCubit
class AsyncBlocBuilder<B extends AsyncCubit<L, R>, L, R>
    extends BlocBuilder<B, AsyncState<L, R>> {
  const AsyncBlocBuilder({
    required super.builder,
    super.key,
    super.bloc,
    super.buildWhen,
  });
}
