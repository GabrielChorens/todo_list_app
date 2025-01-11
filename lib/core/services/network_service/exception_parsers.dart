import 'dart:io';

import 'package:dio/dio.dart';
import 'package:todo_list_app/core/exceptions/app_exceptions.dart';
import 'package:todo_list_app/core/shared/data/parsing_utils/json_parsers.dart';



extension DioExceptionParserX on DioException {
  AppExceptions toAppException() {
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
        return const NoInternetConnection();
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return const UnknownError();
      case DioExceptionType.badResponse:
        {
          switch (response?.statusCode) {
            case 400:
              return response?.toAppException() ?? const UnknownError();
            case 401:
            case 403:
              return const Unauthorized();
            default:
              return const UnknownError();
          }
        }
    }
  }
}

extension SocketExceptionParserX on SocketException {
  AppExceptions toApiException() {
    return const NoInternetConnection();
  }
}

extension ApiExceptionX on Response<Object?>? {
  AppExceptions toAppException() {
    if (this == null) {
      return const UnknownError();
    }
    final statusCode = this!.statusCode;
    switch (statusCode) {
      case 400:
        if (this?.data != null) {
          final data = this?.data?.tryParseToMap();
          if (data == null) {
            return const UnknownError();
          }
          if (data.containsKey('error')) {
            final error = data['error'].toString();
            if (error == 'user not found') {
              return const UserNotFound();
            }
            if (error == 'password not match') {
              return const PasswordNotMatch();
            }
            if (error == 'Note: Only defined users succeed registration') {
              return const InvalidEmailToRegister();
            }
          }
        }
        return const UnknownError();
      case 401:
      case 403:
        return const Unauthorized();
      default:
        return const UnknownError();
    }
  }
}
