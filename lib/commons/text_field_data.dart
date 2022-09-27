import 'package:flutter/material.dart';
import 'package:hello_earth/commons/text_field_error.dart';
import 'package:hello_earth/errors/app_error.dart';
import 'package:hello_earth/injector/injector.dart';
import 'package:hello_earth/pages/navigators/global_navigator.dart';

class TextFieldData {
  final TextEditingController controller = TextEditingController();
  final ValueNotifier<TextFieldError?> validationErrorValueNotifier = ValueNotifier<TextFieldError?>(null);
  final String? errorKey;
  final FocusNode focusNode = FocusNode();
  TextFieldError Function(String text)? _validator;
  bool isErrorForced = false;

  bool get isValid =>
      _validator == null ||
      validationErrorValueNotifier.value is NoneTextFieldError ||
      validationErrorValueNotifier.value == null;

  String get text => controller.text;

  TextFieldData(
    this._validator, {
    this.errorKey,
  }) {
    final TextFieldError Function(String text)? validator = _validator;
    if (validator != null) {
      controller.addListener(() => validationErrorValueNotifier.value = validator(text));
    }
  }

  bool forceApiError(FirebaseError apiError) {
    final BuildContext? context = Injector().get<GlobalNavigator>().currentContext;
    final String? errorKey = this.errorKey;
    if (context != null && errorKey != null) {
      forceError(
        CustomMessageTextFieldError(
          errorMessage: apiError.getMessage(context, errorKey),
        ),
      );
      return true;
    }
    return false;
  }

  bool validate({
    bool forceErrorIfInvalid = false,
  }) {
    final TextFieldError Function(String text)? validator = _validator;
    if (validator == null) {
      return true;
    }
    validationErrorValueNotifier.value = validator(text);
    if (forceErrorIfInvalid && !isValid) {
      isErrorForced = true;
    }
    return isValid;
  }

  static bool forceFirebaseErrors(
    List<TextFieldData> textFieldsData, {
    required FirebaseError apiError,
  }) =>
      textFieldsData
          .map(
            (textFieldData) => textFieldData.forceApiError(apiError),
          )
          .toList()
          .contains(true);

  void forceError(TextFieldError validationError) {
    isErrorForced = true;
    validationErrorValueNotifier.value = validationError;
  }

  static bool validateTextFieldsAndCheckIfAreValid(
    List<TextFieldData> textFieldsData, {
    bool forceErrorIfInvalid = false,
  }) =>
      !textFieldsData
          .map(
            (textFieldData) => textFieldData.validate(
              forceErrorIfInvalid: forceErrorIfInvalid,
            ),
          )
          .toList()
          .contains(false);
}
