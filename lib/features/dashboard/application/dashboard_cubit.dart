import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list_app/core/exceptions/app_exceptions.dart';
import 'package:todo_list_app/core/shared/domain/entities/user.dart';
import 'package:todo_list_app/core/utils/async_cubit_state_management/async_cubit_state_management.dart';
import 'package:todo_list_app/features/dashboard/data/repository/dashboard_repository.dart';

@injectable
class DashboardCubit extends AsyncCubit<AppExceptions, IList<User>> {
  DashboardCubit(this._dashboardRepository)
      : super(const AsyncState.initial()) {
    fetchUsers();
  }

  final DashboardRepository _dashboardRepository;

  Future<void> fetchUsers() async {
    emit(const AsyncState.loading());
    final result = await _dashboardRepository.getUsers();
    result.fold(
      (error) => emit(AsyncState.error(error: error)),
      (users) => emit(AsyncState.success(data: users)),
    );
  }
}
