import 'package:get_it/get_it.dart';
import 'package:hello_earth/pages/navigators/global_navigator.dart';

class Injector {
  static final Injector _instance = Injector._();

  GetIt get _getIt => GetIt.instance;

  factory Injector() => _instance;

  Injector._() {
    _initGlobalNavigator();
  }

  void _initGlobalNavigator() {
    _getIt.registerSingleton(GlobalNavigator());
  }

  T get<T extends Object>([
    String? instanceName,
  ]) {
    return _getIt.get<T>(
      instanceName: instanceName,
    );
  }
}
