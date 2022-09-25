import 'package:flutter/material.dart';
import 'package:hello_earth/commons/text_field_error.dart';
import 'package:hello_earth/errors/app_error.dart';

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

  bool forceApiError(ApiError apiError) {
    final String? errorKey = this.errorKey;
    if (errorKey != null) {
      forceError(
        CustomMessageTextFieldError(
          errorMessage: apiError.getMessage(errorKey),
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

  /// Returns true if at least one text field data contains API error.
  static bool forceApiErrors(
    List<TextFieldData> textFieldsData, {
    required ApiError apiError,
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
