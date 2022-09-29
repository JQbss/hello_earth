import 'package:flutter/cupertino.dart';
import 'package:hello_earth/constants.dart';
import 'package:hello_earth/errors/error_keys.dart';

abstract class AppError {
  const AppError();
}

class FirebaseError extends AppError {
  final String code;

  const FirebaseError({
    required this.code,
  });

  String? getMessage(BuildContext context, String errorKey) {
    if (errorKey == ErrorKeys.email &&
        code == Constants.firebaseErrorCodes.invalidEmail) {
      return 'Nieprawidłowy format adresu e-mail';
    } else if (errorKey == ErrorKeys.email &&
        code == Constants.firebaseErrorCodes.emailAlreadyInUse) {
      return 'Email został wykorzystany';
    } else if (errorKey == ErrorKeys.password &&
        code == Constants.firebaseErrorCodes.wrongPassword) {
      return 'Nieprawidłowe hasło';
    } else if (errorKey == ErrorKeys.email &&
        code == Constants.firebaseErrorCodes.userNotFound) {
      return 'Użytkownik o podanym adresie e-mail nie istnieje';
    } else {
      return code; //'Coś poszło nie tak :/';
    }
  }
}
