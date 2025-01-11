import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list_app/core/exceptions/app_exceptions.dart';
import 'package:todo_list_app/core/services/network_service/instances.dart';
import 'package:todo_list_app/core/services/network_service/network_service.dart';
import 'package:todo_list_app/core/shared/data/parsing_utils/json_parsers.dart';
import 'package:todo_list_app/core/shared/domain/entities/user.dart';
import 'package:todo_list_app/features/profile/data/dto/get_user_dto.dart';

@injectable
class ProfileRepository {
  ProfileRepository({
    required this.reqResService,
  });
  final ReqResService reqResService;

  Future<Either<AppExceptions, User>> getUserProfile(int id) async {
    return reqResService.fetch(
      '/users/$id',
      method: DioRequestMethod.get,
      successDataParser: (data) {
        final dto = GetUserDto.fromJson(data.parseToMap());
        return dto.data.toDomain();
      },
    );
  }

  Future<Either<AppExceptions, User>> updateUserProfile(User user) async {
    return Future.delayed(
      const Duration(seconds: 1),
      () => right(user),
    );
  }
}
