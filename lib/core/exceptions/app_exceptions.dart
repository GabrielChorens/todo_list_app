import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exceptions.freezed.dart';

///App custom exceptions
@freezed
class AppExceptions with _$AppExceptions {
  const factory AppExceptions.userNotFound() = UserNotFound;
  const factory AppExceptions.passwordNotMatch() = PasswordNotMatch;
  const factory AppExceptions.unauthorized() = Unauthorized;
  const factory AppExceptions.invalidEmailToRegister() = InvalidEmailToRegister;
  const factory AppExceptions.unknownError() = UnknownError;
  // TODO(Eval): With more time enhance this exception to be used more widely for retry strategies
  const factory AppExceptions.noInternetConnection() = NoInternetConnection;
}
