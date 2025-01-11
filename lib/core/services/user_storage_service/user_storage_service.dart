import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list_app/core/shared/data/dto/user_dto.dart';
import 'package:todo_list_app/core/shared/domain/entities/user.dart';

const _userKey = 'user';

@lazySingleton
class UserStorageService {
  UserStorageService(this._getStorage);
  final GetStorage _getStorage;

  User? getUser() {
    final userJson = _getStorage.read<Map<String, dynamic>>(_userKey);
    if (userJson == null) return null;
    return UserDto.fromJson(userJson).toDomain();
  }

  void saveUser(User user) {
    _getStorage.write(_userKey, UserDto.fromDomain(user).toJson());
  }

  void deleteUser() {
    _getStorage.remove(_userKey);
  }

}
