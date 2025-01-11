// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:get_storage/get_storage.dart' as _i792;
import 'package:injectable/injectable.dart' as _i526;
import 'package:todo_list_app/core/di/third_party_modules.dart' as _i829;
import 'package:todo_list_app/core/services/network_service/instances.dart'
    as _i352;
import 'package:todo_list_app/core/services/task_storage_service/tasks_storage_service.dart'
    as _i375;
import 'package:todo_list_app/core/services/token_storage_service/token_storage_service.dart'
    as _i163;
import 'package:todo_list_app/core/services/user_storage_service/user_storage_service.dart'
    as _i899;
import 'package:todo_list_app/core/shared/application/core_controller_cubit.dart'
    as _i947;
import 'package:todo_list_app/features/auth/application/auth_cubit.dart'
    as _i489;
import 'package:todo_list_app/features/auth/data/repositories/auth_repository.dart'
    as _i1022;
import 'package:todo_list_app/features/dashboard/application/dashboard_cubit.dart'
    as _i134;
import 'package:todo_list_app/features/dashboard/data/repository/dashboard_repository.dart'
    as _i74;
import 'package:todo_list_app/features/home/application/home_cubit.dart'
    as _i847;
import 'package:todo_list_app/features/home/data/repository/task_repository.dart'
    as _i323;
import 'package:todo_list_app/features/language/application/language_cubit.dart'
    as _i930;
import 'package:todo_list_app/features/language/data/repository/storage_service.dart'
    as _i328;
import 'package:todo_list_app/features/profile/application/update_profile_cubit.dart'
    as _i704;
import 'package:todo_list_app/features/profile/data/repository/profile_repository.dart'
    as _i1014;
import 'package:todo_list_app/features/theming/application/theme_cubit.dart'
    as _i1073;
import 'package:todo_list_app/features/theming/data/theming_repository.dart'
    as _i155;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreModule = _$CoreModule();
    gh.singleton<_i352.ReqResService>(() => _i352.ReqResService());
    gh.singleton<_i352.JsonPlaceholderService>(
        () => _i352.JsonPlaceholderService());
    gh.lazySingleton<_i792.GetStorage>(() => coreModule.storage);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => coreModule.secureStorage);
    gh.factory<_i155.ThemingRepository>(
        () => _i155.ThemingRepository(gh<_i792.GetStorage>()));
    gh.factory<_i375.TaskStorageService>(
        () => _i375.TaskStorageService(gh<_i792.GetStorage>()));
    gh.lazySingleton<_i899.UserStorageService>(
        () => _i899.UserStorageService(gh<_i792.GetStorage>()));
    gh.factory<_i328.LanguageCodeRepository>(
        () => _i328.LanguageCodeRepository(gh<_i792.GetStorage>()));
    gh.factory<_i323.TaskRepository>(() => _i323.TaskRepository(
          gh<_i375.TaskStorageService>(),
          gh<_i352.JsonPlaceholderService>(),
        ));
    gh.factory<_i1014.ProfileRepository>(() =>
        _i1014.ProfileRepository(reqResService: gh<_i352.ReqResService>()));
    gh.factory<_i74.DashboardRepository>(() =>
        _i74.DashboardRepository(reqResService: gh<_i352.ReqResService>()));
    gh.lazySingleton<_i163.TokenStorageService>(
        () => _i163.TokenStorageService(gh<_i558.FlutterSecureStorage>()));
    gh.singleton<_i930.LanguageCubit>(
        () => _i930.LanguageCubit(gh<_i328.LanguageCodeRepository>()));
    gh.factory<_i1022.AuthRepository>(
        () => _i1022.AuthRepository(gh<_i352.ReqResService>()));
    gh.singleton<_i947.CoreControllerCubit>(() => _i947.CoreControllerCubit(
          gh<_i899.UserStorageService>(),
          gh<_i163.TokenStorageService>(),
        ));
    gh.lazySingleton<_i847.HomeCubit>(
        () => _i847.HomeCubit(gh<_i323.TaskRepository>()));
    gh.singleton<_i1073.ThemeCubit>(
        () => _i1073.ThemeCubit(gh<_i155.ThemingRepository>()));
    gh.factory<_i134.DashboardCubit>(
        () => _i134.DashboardCubit(gh<_i74.DashboardRepository>()));
    gh.factory<_i489.AuthCubit>(() => _i489.AuthCubit(
          gh<_i1022.AuthRepository>(),
          gh<_i947.CoreControllerCubit>(),
        ));
    gh.factory<_i704.UpdateProfileCubit>(() => _i704.UpdateProfileCubit(
          gh<_i947.CoreControllerCubit>(),
          gh<_i1014.ProfileRepository>(),
        ));
    return this;
  }
}

class _$CoreModule extends _i829.CoreModule {}
