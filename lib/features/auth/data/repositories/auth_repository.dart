import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list_app/core/exceptions/app_exceptions.dart';
import 'package:todo_list_app/core/services/network_service/instances.dart';
import 'package:todo_list_app/core/shared/data/parsing_utils/json_parsers.dart';
import 'package:todo_list_app/core/shared/domain/entities/user.dart';
import 'package:todo_list_app/features/auth/data/dto/login_dto.dart';
import 'package:todo_list_app/features/auth/data/dto/register_dto.dart';

@injectable
class AuthRepository {
  AuthRepository(
    this._reqResService,
  );
  final ReqResService _reqResService;

  Future<Either<AppExceptions, User>> login(
    String email,
    String password, {
    required void Function(User, String) onSuccess,
  }) async {
    final x = await _reqResService.fetch(
      '/login',
      body: {
        'email': email,
        'password': password,
      },
      successDataParser: (answer) {
        final dto = LoginDto.fromJson(answer.parseToMap());
        final user = User(
          //Hardcoded id for the sake of the example. In a real app, the id would be parsed from the response as well
          //as other user data.
          id: 1,
          email: email,
        );
        onSuccess(user, dto.token);
        return user;
      },
    );
    return x;
  }

  Future<Either<AppExceptions, User>> register(
    String email,
    String password, {
    required void Function(User, String) onSuccess,
  }) async {
    return _reqResService.fetch(
      '/register',
      body: {
        'email': email,
        'password': password,
      },
      successDataParser: (answer) {
        final dto = RegisterDto.fromJson(answer.parseToMap());

        final user = User(
          id: dto.id,
          email: email,
        );

        onSuccess(user, dto.token);
        return user;
      },
    );
  }

  Future<Either<AppExceptions, Unit>> logout(
    void Function() onSuccess,
  ) async {
    //Simulating a delay for the sake of the example
    await Future<void>.delayed(const Duration(seconds: 1));
    onSuccess();

    return right(unit);
  }
}
