import 'package:flutter/cupertino.dart';
import 'package:hello_earth/constants.dart';
import 'package:hello_earth/errors/error_keys.dart';

abstract class AppError {
  const AppError();
}

class FirebaseError extends AppError {
  final code;

  const FirebaseError({
    required this.code,
  });

  String? getMessage(BuildContext context, String errorKey) {
    if (errorKey == ErrorKeys.email && code == Constants.firebaseErrorCodes.invalidEmail) {
      return 'Nieprawidłowy format adresu e-mail';
    } else {
      return null;
    }
  }
}
