import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello_earth/errors/app_error.dart';

class ApiErrorFactory {
  const ApiErrorFactory._();

  static FirebaseError? provideFirebaseAuthError(dynamic error) {
    if (error is FirebaseAuthException) {
      return FirebaseError(
        code: error.code,
      );
    } else {
      return null;
    }
  }
}
