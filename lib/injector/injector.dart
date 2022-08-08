import 'package:get_it/get_it.dart';
import 'package:hello_earth/pages/navigators/global_navigator.dart';
import 'package:hello_earth/storages/secure_storage.dart';
import 'package:hello_earth/storages/session_storage.dart';

class Injector {
  static final Injector _instance = Injector._();

  GetIt get _getIt => GetIt.instance;

  factory Injector() => _instance;

  Injector._() {
    _initGlobalNavigator();
    _initStorage();
  }

  void _initGlobalNavigator() {
    _getIt.registerSingleton(GlobalNavigator());
  }

  void _initStorage() {
    _getIt
      ..registerFactory(() => SecureStorage())
      ..registerFactory(
        () => SessionStorage(secureStorage: get<SecureStorage>()),
      );
  }

  T get<T extends Object>([
    String? instanceName,
  ]) {
    return _getIt.get<T>(
      instanceName: instanceName,
    );
  }
}
