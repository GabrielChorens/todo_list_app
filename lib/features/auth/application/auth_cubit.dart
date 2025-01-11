import 'package:injectable/injectable.dart';
import 'package:todo_list_app/core/exceptions/app_exceptions.dart';
import 'package:todo_list_app/core/shared/application/core_controller_cubit.dart';
import 'package:todo_list_app/core/shared/domain/entities/user.dart';
import 'package:todo_list_app/core/utils/async_cubit_state_management/async_cubit_state_management.dart';
import 'package:todo_list_app/features/auth/data/repositories/auth_repository.dart';

@injectable
class AuthCubit extends AsyncCubit<AppExceptions, User> {
  AuthCubit(this._authRepository, this._coreControllerCubit)
      : super(const AsyncState.initial());

  final AuthRepository _authRepository;
  final CoreControllerCubit _coreControllerCubit;
  Future<void> login(String email, String password) async {
    emit(const AsyncState.loading());
    //Simulating a password check.
    if (password != '123456') {
      emit(const AsyncState.error(error: AppExceptions.passwordNotMatch()));
      return;
    }

    final result = await _authRepository.login(
      email,
      password,
      onSuccess: _coreControllerCubit.authenticate,
    );
    result.fold(
      (error) => emit(AsyncState.error(error: error)),
      (user) => emit(AsyncState.success(data: user)),
    );
  }

  Future<void> register(String email, String password) async {
    emit(const AsyncState.loading());
    final result = await _authRepository.register(
      email,
      password,
      onSuccess: _coreControllerCubit.authenticate,
    );
    result.fold(
      (error) => emit(AsyncState.error(error: error)),
      (user) => emit(AsyncState.success(data: user)),
    );
  }
}
