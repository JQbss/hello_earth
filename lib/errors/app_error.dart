import 'package:flutter/cupertino.dart';
import 'package:hello_earth/constants.dart';
import 'package:hello_earth/errors/error_keys.dart';
import 'package:hello_earth/generated/l10n.dart';

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
      return S.of(context).errorInvalidEmail;
    } else if (errorKey == ErrorKeys.email &&
        code == Constants.firebaseErrorCodes.emailAlreadyInUse) {
      return S.of(context).errorEmailAlreadyInUse;
    } else if (errorKey == ErrorKeys.password &&
        code == Constants.firebaseErrorCodes.wrongPassword) {
      return S.of(context).errorWrongPassword;
    } else if (errorKey == ErrorKeys.email &&
        code == Constants.firebaseErrorCodes.userNotFound) {
      return S.of(context).errorUserNotFound;
    } else if (errorKey == ErrorKeys.email) {
      return code;
    }
    return null;
  }
}
