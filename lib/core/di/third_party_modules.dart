import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CoreModule {
  @lazySingleton
  GetStorage get storage => GetStorage();

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
}
