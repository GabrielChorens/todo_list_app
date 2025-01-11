import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list_app/core/di/app_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: false,
  asExtension: true,
)
void configureDependencies() {
  getIt.init();
}
