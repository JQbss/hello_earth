import 'package:firebase_auth/firebase_auth.dart';

class Constants {
  static final _DatabaseConfig databaseConfig = _DatabaseConfig();
  static final _FirebaseErrorCodes firebaseErrorCodes = _FirebaseErrorCodes();

  const Constants._();
}

class _DatabaseConfig {
  final String devDatabase = 'https://helloearth-dev-default-rtdb.europe-west1.firebasedatabase.app';
  final String prodDatabase = 'https://helloearth-7e025-default-rtdb.europe-west1.firebasedatabase.app';
}

class _FirebaseErrorCodes {
  final String emailAlreadyInUse = 'email-already-in-use';
  final String invalidEmail = 'invalid-email';
  final String wrongPassword = 'wrong-password';
  final String userNotFound = 'user-not-found';
}
