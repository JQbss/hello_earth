import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';
import 'package:hello_earth/pages/navigators/global_navigator.dart';
import 'package:hello_earth/repositories/credential/network_credential_repository.dart';
import 'package:hello_earth/repositories/family/natwork_family_repository.dart';
import 'package:hello_earth/repositories/user/network_user_repository.dart';
import 'package:hello_earth/storages/secure_storage.dart';

class Injector {
  static final Injector _instance = Injector._();

  GetIt get _getIt => GetIt.instance;

  factory Injector() => _instance;

  Injector._() {
    _initDatabaseReference();
    _initFirebaseAuth();
    _initGlobalNavigator();
    _initNetworkRepositories(
      auth: _getIt.get<FirebaseAuth>(),
      reference: _getIt.get<DatabaseReference>(),
    );
    _initStorage();
  }

  void _initDatabaseReference() {
    final DatabaseReference reference = FirebaseDatabase.instance.ref();
    _getIt.registerSingleton<DatabaseReference>(reference);
  }

  void _initFirebaseAuth() {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    _getIt.registerSingleton<FirebaseAuth>(firebaseAuth);
  }

  void _initGlobalNavigator() {
    _getIt.registerSingleton(GlobalNavigator());
  }

  void _initNetworkRepositories({
    required FirebaseAuth auth,
    required DatabaseReference reference,
  }) {
    _getIt
      ..registerFactory(
        () => NetworkCredentialRepository(
          auth: auth,
        ),
      )
      ..registerFactory(
        () => NetworkFamilyRepository(
          reference: reference,
        ),
      )
      ..registerFactory(
        () => NetworkUserRepository(
          reference: reference,
        ),
      );
  }

  void _initStorage() {
    _getIt
      ..registerFactory(
        () => SecureStorage(),
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
