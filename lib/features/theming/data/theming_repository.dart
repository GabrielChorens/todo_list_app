import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';

const String _key = 'theme';

@injectable
class ThemingRepository {
  ThemingRepository(this._getStorage);

  final GetStorage _getStorage;

  String? getTheme() {
    return _getStorage.read(_key);
  }

  void setTheme(String theme) {
    _getStorage.write(_key, theme);
  }
}
