import 'package:hello_earth/commons/text_field_error.dart';
import 'package:hello_earth/utils/validator_util.dart';

class TextFieldValidatorsUtil {
  const TextFieldValidatorsUtil._();

  static TextFieldError validateEmail(String name) {
    if(ValidatorUtil.isNullOrBlank(name)){
      return BlankTextFieldError();
    } else {
      return NoneTextFieldError();
    }
  }

  static TextFieldError validatePassword(String name) {
    if(ValidatorUtil.isNullOrBlank(name)){
      return BlankTextFieldError();
    } else {
      return NoneTextFieldError();
    }
  }

  static TextFieldError validateName(String name) {
    if(ValidatorUtil.isNullOrBlank(name)){
      return BlankTextFieldError();
    } else {
      return NoneTextFieldError();
    }
  }
}
