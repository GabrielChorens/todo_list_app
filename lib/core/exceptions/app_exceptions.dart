import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exceptions.freezed.dart';

@freezed
class AppExceptions with _$AppExceptions {
  const factory AppExceptions.userNotFound() = UserNotFound;
  const factory AppExceptions.passwordNotMatch() = PasswordNotMatch;
  const factory AppExceptions.unauthorized() = Unauthorized;
  const factory AppExceptions.invalidEmailToRegister() = InvalidEmailToRegister;
  const factory AppExceptions.unknownError() = UnknownError;
  const factory AppExceptions.noInternetConnection() = NoInternetConnection;
}
