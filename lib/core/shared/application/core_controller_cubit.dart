import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list_app/core/services/token_storage_service/token_storage_service.dart';
import 'package:todo_list_app/core/services/user_storage_service/user_storage_service.dart';
import 'package:todo_list_app/core/shared/domain/entities/user.dart';

part 'core_controller_cubit.freezed.dart';

///Cubit to manage the authentication state of the app.
@singleton
class CoreControllerCubit extends Cubit<CoreControllerState> {
  CoreControllerCubit(
    this._userStorageService,
    this._tokenStorageService,
  ) : super(const CoreControllerInitial());
  final UserStorageService _userStorageService;
  final TokenStorageService _tokenStorageService;

  Future<void> initialize() async {
    if (state is Authenticated) return;
    final user = _userStorageService.getUser();
    final token = await _tokenStorageService.getToken();

    if (user != null && token != null) {
      emit(CoreControllerState.authenticated(user: user));
    } else {
      emit(const CoreControllerState.unauthenticated());
      _userStorageService.deleteUser();
      unawaited(_tokenStorageService.deleteToken());
    }
  }

  Future<void> authenticate(User user, String token) async {
    _userStorageService.saveUser(user);
    await _tokenStorageService.saveToken(token);
    emit(CoreControllerState.authenticated(user: user));
  }

  Future<void> updateUser(User user) async {
    _userStorageService.saveUser(user);
    emit(CoreControllerState.authenticated(user: user));
  }

  Future<void> unauthenticate() async {
    _userStorageService.deleteUser();
    await _tokenStorageService.deleteToken();
    emit(const CoreControllerState.unauthenticated());
  }
}

@freezed
class CoreControllerState with _$CoreControllerState {
  const factory CoreControllerState.initial() = CoreControllerInitial;
  const factory CoreControllerState.authenticated({
    required User user,
  }) = Authenticated;
  const factory CoreControllerState.unauthenticated() = Unauthenticated;

  const CoreControllerState._();

  bool get isAuthenticated => this is Authenticated;
  bool get isUnauthenticated => this is Unauthenticated;

  User? get user => isAuthenticated ? (this as Authenticated).user : null;
}
