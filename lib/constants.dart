class Constants {
  static final _DatabaseConfig databaseConfig = _DatabaseConfig();

  const Constants._();
}

class _DatabaseConfig {
  final String devDatabase = 'https://helloearth-dev-default-rtdb.europe-west1.firebasedatabase.app';
  final String prodDatabase = 'https://helloearth-7e025-default-rtdb.europe-west1.firebasedatabase.app';
}
