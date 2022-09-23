import 'package:flutter/material.dart';
import 'package:hello_earth/commons/text_field_error.dart';

class TextFieldData {
  final TextEditingController controller = TextEditingController();
  final ValueNotifier<TextFieldError?> validationErrorValueNotifier = ValueNotifier<TextFieldError?>(null);
  final String? errorKey;
  TextFieldError Function(String text)? validator;
  bool isErrorForced = false;

  TextFieldData(
    this.validator, {
    this.errorKey,
  }) {
    controller.addListener(() => validationErrorValueNotifier.value = validator?.call(text));
  }

  String get text => controller.text;

  bool get isValid =>
      validator == null ||
      validationErrorValueNotifier.value is NoneTextFieldError ||
      validationErrorValueNotifier.value == null;

  bool validate({
    bool forceErrorIfInvalid = false,
  }) {
    if (validator == null) {
      return true;
    }
    validationErrorValueNotifier.value = validator?.call(text);
    if (forceErrorIfInvalid && !isValid) {
      isErrorForced = true;
    }
    return isValid;
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
