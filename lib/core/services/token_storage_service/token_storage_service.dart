import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

const _tokenKey = 'token';

@lazySingleton
class TokenStorageService {
  TokenStorageService(this.secureStorage);
  final FlutterSecureStorage secureStorage;

  Future<void> saveToken(String token) async {
    await secureStorage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return secureStorage.read(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    await secureStorage.delete(key: _tokenKey);
  }
}
