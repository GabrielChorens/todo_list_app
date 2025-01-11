// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppExceptions {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() userNotFound,
    required TResult Function() passwordNotMatch,
    required TResult Function() unauthorized,
    required TResult Function() invalidEmailToRegister,
    required TResult Function() unknownError,
    required TResult Function() noInternetConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? userNotFound,
    TResult? Function()? passwordNotMatch,
    TResult? Function()? unauthorized,
    TResult? Function()? invalidEmailToRegister,
    TResult? Function()? unknownError,
    TResult? Function()? noInternetConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? userNotFound,
    TResult Function()? passwordNotMatch,
    TResult Function()? unauthorized,
    TResult Function()? invalidEmailToRegister,
    TResult Function()? unknownError,
    TResult Function()? noInternetConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(PasswordNotMatch value) passwordNotMatch,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(InvalidEmailToRegister value)
        invalidEmailToRegister,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(NoInternetConnection value) noInternetConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(PasswordNotMatch value)? passwordNotMatch,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(InvalidEmailToRegister value)? invalidEmailToRegister,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(NoInternetConnection value)? noInternetConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(PasswordNotMatch value)? passwordNotMatch,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(InvalidEmailToRegister value)? invalidEmailToRegister,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionsCopyWith<$Res> {
  factory $AppExceptionsCopyWith(
          AppExceptions value, $Res Function(AppExceptions) then) =
      _$AppExceptionsCopyWithImpl<$Res, AppExceptions>;
}

/// @nodoc
class _$AppExceptionsCopyWithImpl<$Res, $Val extends AppExceptions>
    implements $AppExceptionsCopyWith<$Res> {
  _$AppExceptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UserNotFoundImplCopyWith<$Res> {
  factory _$$UserNotFoundImplCopyWith(
          _$UserNotFoundImpl value, $Res Function(_$UserNotFoundImpl) then) =
      __$$UserNotFoundImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserNotFoundImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$UserNotFoundImpl>
    implements _$$UserNotFoundImplCopyWith<$Res> {
  __$$UserNotFoundImplCopyWithImpl(
      _$UserNotFoundImpl _value, $Res Function(_$UserNotFoundImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserNotFoundImpl implements UserNotFound {
  const _$UserNotFoundImpl();

  @override
  String toString() {
    return 'AppExceptions.userNotFound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserNotFoundImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() userNotFound,
    required TResult Function() passwordNotMatch,
    required TResult Function() unauthorized,
    required TResult Function() invalidEmailToRegister,
    required TResult Function() unknownError,
    required TResult Function() noInternetConnection,
  }) {
    return userNotFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? userNotFound,
    TResult? Function()? passwordNotMatch,
    TResult? Function()? unauthorized,
    TResult? Function()? invalidEmailToRegister,
    TResult? Function()? unknownError,
    TResult? Function()? noInternetConnection,
  }) {
    return userNotFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? userNotFound,
    TResult Function()? passwordNotMatch,
    TResult Function()? unauthorized,
    TResult Function()? invalidEmailToRegister,
    TResult Function()? unknownError,
    TResult Function()? noInternetConnection,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(PasswordNotMatch value) passwordNotMatch,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(InvalidEmailToRegister value)
        invalidEmailToRegister,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(NoInternetConnection value) noInternetConnection,
  }) {
    return userNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(PasswordNotMatch value)? passwordNotMatch,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(InvalidEmailToRegister value)? invalidEmailToRegister,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(NoInternetConnection value)? noInternetConnection,
  }) {
    return userNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(PasswordNotMatch value)? passwordNotMatch,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(InvalidEmailToRegister value)? invalidEmailToRegister,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound(this);
    }
    return orElse();
  }
}

abstract class UserNotFound implements AppExceptions {
  const factory UserNotFound() = _$UserNotFoundImpl;
}

/// @nodoc
abstract class _$$PasswordNotMatchImplCopyWith<$Res> {
  factory _$$PasswordNotMatchImplCopyWith(_$PasswordNotMatchImpl value,
          $Res Function(_$PasswordNotMatchImpl) then) =
      __$$PasswordNotMatchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PasswordNotMatchImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$PasswordNotMatchImpl>
    implements _$$PasswordNotMatchImplCopyWith<$Res> {
  __$$PasswordNotMatchImplCopyWithImpl(_$PasswordNotMatchImpl _value,
      $Res Function(_$PasswordNotMatchImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PasswordNotMatchImpl implements PasswordNotMatch {
  const _$PasswordNotMatchImpl();

  @override
  String toString() {
    return 'AppExceptions.passwordNotMatch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PasswordNotMatchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() userNotFound,
    required TResult Function() passwordNotMatch,
    required TResult Function() unauthorized,
    required TResult Function() invalidEmailToRegister,
    required TResult Function() unknownError,
    required TResult Function() noInternetConnection,
  }) {
    return passwordNotMatch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? userNotFound,
    TResult? Function()? passwordNotMatch,
    TResult? Function()? unauthorized,
    TResult? Function()? invalidEmailToRegister,
    TResult? Function()? unknownError,
    TResult? Function()? noInternetConnection,
  }) {
    return passwordNotMatch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? userNotFound,
    TResult Function()? passwordNotMatch,
    TResult Function()? unauthorized,
    TResult Function()? invalidEmailToRegister,
    TResult Function()? unknownError,
    TResult Function()? noInternetConnection,
    required TResult orElse(),
  }) {
    if (passwordNotMatch != null) {
      return passwordNotMatch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(PasswordNotMatch value) passwordNotMatch,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(InvalidEmailToRegister value)
        invalidEmailToRegister,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(NoInternetConnection value) noInternetConnection,
  }) {
    return passwordNotMatch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(PasswordNotMatch value)? passwordNotMatch,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(InvalidEmailToRegister value)? invalidEmailToRegister,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(NoInternetConnection value)? noInternetConnection,
  }) {
    return passwordNotMatch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(PasswordNotMatch value)? passwordNotMatch,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(InvalidEmailToRegister value)? invalidEmailToRegister,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    required TResult orElse(),
  }) {
    if (passwordNotMatch != null) {
      return passwordNotMatch(this);
    }
    return orElse();
  }
}

abstract class PasswordNotMatch implements AppExceptions {
  const factory PasswordNotMatch() = _$PasswordNotMatchImpl;
}

/// @nodoc
abstract class _$$UnauthorizedImplCopyWith<$Res> {
  factory _$$UnauthorizedImplCopyWith(
          _$UnauthorizedImpl value, $Res Function(_$UnauthorizedImpl) then) =
      __$$UnauthorizedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthorizedImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$UnauthorizedImpl>
    implements _$$UnauthorizedImplCopyWith<$Res> {
  __$$UnauthorizedImplCopyWithImpl(
      _$UnauthorizedImpl _value, $Res Function(_$UnauthorizedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnauthorizedImpl implements Unauthorized {
  const _$UnauthorizedImpl();

  @override
  String toString() {
    return 'AppExceptions.unauthorized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthorizedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() userNotFound,
    required TResult Function() passwordNotMatch,
    required TResult Function() unauthorized,
    required TResult Function() invalidEmailToRegister,
    required TResult Function() unknownError,
    required TResult Function() noInternetConnection,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? userNotFound,
    TResult? Function()? passwordNotMatch,
    TResult? Function()? unauthorized,
    TResult? Function()? invalidEmailToRegister,
    TResult? Function()? unknownError,
    TResult? Function()? noInternetConnection,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? userNotFound,
    TResult Function()? passwordNotMatch,
    TResult Function()? unauthorized,
    TResult Function()? invalidEmailToRegister,
    TResult Function()? unknownError,
    TResult Function()? noInternetConnection,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(PasswordNotMatch value) passwordNotMatch,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(InvalidEmailToRegister value)
        invalidEmailToRegister,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(NoInternetConnection value) noInternetConnection,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(PasswordNotMatch value)? passwordNotMatch,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(InvalidEmailToRegister value)? invalidEmailToRegister,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(NoInternetConnection value)? noInternetConnection,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(PasswordNotMatch value)? passwordNotMatch,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(InvalidEmailToRegister value)? invalidEmailToRegister,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class Unauthorized implements AppExceptions {
  const factory Unauthorized() = _$UnauthorizedImpl;
}

/// @nodoc
abstract class _$$InvalidEmailToRegisterImplCopyWith<$Res> {
  factory _$$InvalidEmailToRegisterImplCopyWith(
          _$InvalidEmailToRegisterImpl value,
          $Res Function(_$InvalidEmailToRegisterImpl) then) =
      __$$InvalidEmailToRegisterImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidEmailToRegisterImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$InvalidEmailToRegisterImpl>
    implements _$$InvalidEmailToRegisterImplCopyWith<$Res> {
  __$$InvalidEmailToRegisterImplCopyWithImpl(
      _$InvalidEmailToRegisterImpl _value,
      $Res Function(_$InvalidEmailToRegisterImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InvalidEmailToRegisterImpl implements InvalidEmailToRegister {
  const _$InvalidEmailToRegisterImpl();

  @override
  String toString() {
    return 'AppExceptions.invalidEmailToRegister()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidEmailToRegisterImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() userNotFound,
    required TResult Function() passwordNotMatch,
    required TResult Function() unauthorized,
    required TResult Function() invalidEmailToRegister,
    required TResult Function() unknownError,
    required TResult Function() noInternetConnection,
  }) {
    return invalidEmailToRegister();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? userNotFound,
    TResult? Function()? passwordNotMatch,
    TResult? Function()? unauthorized,
    TResult? Function()? invalidEmailToRegister,
    TResult? Function()? unknownError,
    TResult? Function()? noInternetConnection,
  }) {
    return invalidEmailToRegister?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? userNotFound,
    TResult Function()? passwordNotMatch,
    TResult Function()? unauthorized,
    TResult Function()? invalidEmailToRegister,
    TResult Function()? unknownError,
    TResult Function()? noInternetConnection,
    required TResult orElse(),
  }) {
    if (invalidEmailToRegister != null) {
      return invalidEmailToRegister();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(PasswordNotMatch value) passwordNotMatch,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(InvalidEmailToRegister value)
        invalidEmailToRegister,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(NoInternetConnection value) noInternetConnection,
  }) {
    return invalidEmailToRegister(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(PasswordNotMatch value)? passwordNotMatch,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(InvalidEmailToRegister value)? invalidEmailToRegister,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(NoInternetConnection value)? noInternetConnection,
  }) {
    return invalidEmailToRegister?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(PasswordNotMatch value)? passwordNotMatch,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(InvalidEmailToRegister value)? invalidEmailToRegister,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    required TResult orElse(),
  }) {
    if (invalidEmailToRegister != null) {
      return invalidEmailToRegister(this);
    }
    return orElse();
  }
}

abstract class InvalidEmailToRegister implements AppExceptions {
  const factory InvalidEmailToRegister() = _$InvalidEmailToRegisterImpl;
}

/// @nodoc
abstract class _$$UnknownErrorImplCopyWith<$Res> {
  factory _$$UnknownErrorImplCopyWith(
          _$UnknownErrorImpl value, $Res Function(_$UnknownErrorImpl) then) =
      __$$UnknownErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnknownErrorImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$UnknownErrorImpl>
    implements _$$UnknownErrorImplCopyWith<$Res> {
  __$$UnknownErrorImplCopyWithImpl(
      _$UnknownErrorImpl _value, $Res Function(_$UnknownErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnknownErrorImpl implements UnknownError {
  const _$UnknownErrorImpl();

  @override
  String toString() {
    return 'AppExceptions.unknownError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnknownErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() userNotFound,
    required TResult Function() passwordNotMatch,
    required TResult Function() unauthorized,
    required TResult Function() invalidEmailToRegister,
    required TResult Function() unknownError,
    required TResult Function() noInternetConnection,
  }) {
    return unknownError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? userNotFound,
    TResult? Function()? passwordNotMatch,
    TResult? Function()? unauthorized,
    TResult? Function()? invalidEmailToRegister,
    TResult? Function()? unknownError,
    TResult? Function()? noInternetConnection,
  }) {
    return unknownError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? userNotFound,
    TResult Function()? passwordNotMatch,
    TResult Function()? unauthorized,
    TResult Function()? invalidEmailToRegister,
    TResult Function()? unknownError,
    TResult Function()? noInternetConnection,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(PasswordNotMatch value) passwordNotMatch,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(InvalidEmailToRegister value)
        invalidEmailToRegister,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(NoInternetConnection value) noInternetConnection,
  }) {
    return unknownError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(PasswordNotMatch value)? passwordNotMatch,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(InvalidEmailToRegister value)? invalidEmailToRegister,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(NoInternetConnection value)? noInternetConnection,
  }) {
    return unknownError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(PasswordNotMatch value)? passwordNotMatch,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(InvalidEmailToRegister value)? invalidEmailToRegister,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(this);
    }
    return orElse();
  }
}

abstract class UnknownError implements AppExceptions {
  const factory UnknownError() = _$UnknownErrorImpl;
}

/// @nodoc
abstract class _$$NoInternetConnectionImplCopyWith<$Res> {
  factory _$$NoInternetConnectionImplCopyWith(_$NoInternetConnectionImpl value,
          $Res Function(_$NoInternetConnectionImpl) then) =
      __$$NoInternetConnectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoInternetConnectionImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$NoInternetConnectionImpl>
    implements _$$NoInternetConnectionImplCopyWith<$Res> {
  __$$NoInternetConnectionImplCopyWithImpl(_$NoInternetConnectionImpl _value,
      $Res Function(_$NoInternetConnectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NoInternetConnectionImpl implements NoInternetConnection {
  const _$NoInternetConnectionImpl();

  @override
  String toString() {
    return 'AppExceptions.noInternetConnection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoInternetConnectionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() userNotFound,
    required TResult Function() passwordNotMatch,
    required TResult Function() unauthorized,
    required TResult Function() invalidEmailToRegister,
    required TResult Function() unknownError,
    required TResult Function() noInternetConnection,
  }) {
    return noInternetConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? userNotFound,
    TResult? Function()? passwordNotMatch,
    TResult? Function()? unauthorized,
    TResult? Function()? invalidEmailToRegister,
    TResult? Function()? unknownError,
    TResult? Function()? noInternetConnection,
  }) {
    return noInternetConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? userNotFound,
    TResult Function()? passwordNotMatch,
    TResult Function()? unauthorized,
    TResult Function()? invalidEmailToRegister,
    TResult Function()? unknownError,
    TResult Function()? noInternetConnection,
    required TResult orElse(),
  }) {
    if (noInternetConnection != null) {
      return noInternetConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(PasswordNotMatch value) passwordNotMatch,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(InvalidEmailToRegister value)
        invalidEmailToRegister,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(NoInternetConnection value) noInternetConnection,
  }) {
    return noInternetConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(PasswordNotMatch value)? passwordNotMatch,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(InvalidEmailToRegister value)? invalidEmailToRegister,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(NoInternetConnection value)? noInternetConnection,
  }) {
    return noInternetConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(PasswordNotMatch value)? passwordNotMatch,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(InvalidEmailToRegister value)? invalidEmailToRegister,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    required TResult orElse(),
  }) {
    if (noInternetConnection != null) {
      return noInternetConnection(this);
    }
    return orElse();
  }
}

abstract class NoInternetConnection implements AppExceptions {
  const factory NoInternetConnection() = _$NoInternetConnectionImpl;
}
