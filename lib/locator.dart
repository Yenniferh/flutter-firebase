import 'package:get_it/get_it.dart';
import 'package:shopping_for_friends/services/database.dart';
import 'package:shopping_for_friends/services/firebase.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => DatabaseService());
}