import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hello_earth/generated/l10n.dart';

abstract class TextFieldError extends Equatable {
  const TextFieldError();

  String? message(BuildContext context);

  @override
  List<dynamic> get props => [];
}

class CustomMessageTextFieldError extends TextFieldError {
  final String? errorMessage;

  const CustomMessageTextFieldError({
    this.errorMessage,
  });

  @override
  String? message(BuildContext context) {
    return errorMessage;
  }

  @override
  List<Object> get props => [
        errorMessage ?? '',
      ];
}

class BlankTextFieldError extends TextFieldError {
  @override
  String? message(BuildContext context) => S.of(context).textFieldErrorBlank;
}

class NoneTextFieldError extends TextFieldError {
  @override
  String? message(BuildContext context) => null;
}