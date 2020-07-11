import 'package:get_it/get_it.dart';
import 'package:starter_app/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupDI() {
  locator.registerLazySingleton(() => NavigationService());
}
