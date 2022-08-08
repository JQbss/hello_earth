import 'package:hello_earth/storages/secure_storage.dart';
import 'package:hello_earth/storages/storage_keys.dart';

class SessionStorage {
  final SecureStorage secureStorage;

  const SessionStorage({
    required this.secureStorage,
  });

  Future<bool> hasChildToken() async => (await getParentToken())?.isEmpty ?? false;

  Future<bool> hasParentToken() async => (await getChildToken())?.isEmpty ?? false;

  Future<String?> getChildToken() async => secureStorage.getString(
        key: StorageKeys.childToken,
      );

  Future<String?> getParentToken() async => secureStorage.getString(
        key: StorageKeys.parentToken,
      );
}
