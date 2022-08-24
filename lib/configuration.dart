import 'package:hello_earth/constants.dart';
import 'package:hello_earth/environment.dart';

class Configuration {
  static String currentDatabase = Constants.databaseConfig.devDatabase;
  static Environment currentEnvironment = Environment.dev;

  const Configuration._();

  static Future<void> initialize(Environment environment) async {
    currentEnvironment = environment;
    if(environment == Environment.prod) {
      currentDatabase = Constants.databaseConfig.prodDatabase;
    }
  }
}
