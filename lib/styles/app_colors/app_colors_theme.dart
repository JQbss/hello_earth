import 'package:flutter/material.dart';

abstract class AppColorsTheme {
  final Color appBackground;
  final Color disabled;
  final Color primary;
  final Color error;
  final Color secondary;
  final Color buttonText;
  final Color textFieldBackground;

  const AppColorsTheme({
    required this.appBackground,
    required this.disabled,
    required this.error,
    required this.primary,
    required this.secondary,
    required this.buttonText,
    required this.textFieldBackground,
  });
}
