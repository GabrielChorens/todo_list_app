import 'package:injectable/injectable.dart';
import 'package:todo_list_app/core/exceptions/app_exceptions.dart';
import 'package:todo_list_app/core/shared/application/core_controller_cubit.dart';
import 'package:todo_list_app/core/shared/domain/entities/user.dart';
import 'package:todo_list_app/core/utils/async_cubit_state_management/async_cubit_state_management.dart';
import 'package:todo_list_app/features/profile/data/repository/profile_repository.dart';

@injectable
class UpdateProfileCubit extends AsyncCubit<AppExceptions, User> {
  UpdateProfileCubit(this._controllerCubit, this._profileRepository)
      : super(const AsyncState.initial()) {
    fetchUserProfile();
  }

  final CoreControllerCubit _controllerCubit;
  final ProfileRepository _profileRepository;

  Future<void> fetchUserProfile() async {
    if (_controllerCubit.state is Authenticated) {
      final user = (_controllerCubit.state as Authenticated).user;
      emit(const AsyncState.loading());
      final result = await _profileRepository.getUserProfile(user.id);
      result.fold(
        (error) => emit(AsyncState.error(error: error)),
        (user) {
          _controllerCubit.updateUser(user);
          emit(AsyncState.success(data: user));
        },
      );
    }
  }

  Future<void> updateUserProfile(User user) async {
    emit(const AsyncState.loading());
    final result = await _profileRepository.updateUserProfile(user);
    result.fold(
      (error) => emit(AsyncState.error(error: error)),
      (user) {
        _controllerCubit.updateUser(user);
        emit(AsyncState.success(data: user));
      },
    );
  }
}
