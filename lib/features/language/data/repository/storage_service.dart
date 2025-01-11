import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';

const _languageCodeKey = 'languageCode';

@injectable
class LanguageCodeRepository {
  LanguageCodeRepository(this._storageService);

  final GetStorage _storageService;

  String? getLanguageCode() {
    return _storageService.read<String>(_languageCodeKey);
  }

  void saveLanguageCode(String languageCode) {
    _storageService.write(_languageCodeKey, languageCode);
  }
}
