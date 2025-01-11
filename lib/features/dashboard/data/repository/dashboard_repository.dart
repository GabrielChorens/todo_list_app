import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list_app/core/exceptions/app_exceptions.dart';
import 'package:todo_list_app/core/services/network_service/instances.dart';
import 'package:todo_list_app/core/services/network_service/network_service.dart';
import 'package:todo_list_app/core/shared/data/parsing_utils/json_parsers.dart';
import 'package:todo_list_app/core/shared/domain/entities/user.dart';
import 'package:todo_list_app/features/dashboard/data/dto/get_all_users_dto.dart';

@injectable
class DashboardRepository {
  DashboardRepository({
    required this.reqResService,
  });
  final ReqResService reqResService;

  Future<Either<AppExceptions, IList<User>>> getUsers() async {
    return reqResService.fetch(
      '/users?per_page=12',
      method: DioRequestMethod.get,
      successDataParser: (data) {
        final dto = GetAllUsersDto.fromJson(data.parseToMap());
        return dto.data.map((e) => e.toDomain()).toIList();
      },
    );
  }
}
