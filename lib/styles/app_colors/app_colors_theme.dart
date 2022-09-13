import 'package:flutter/material.dart';

abstract class AppColorsTheme {
  final Color appBackground;
  final Color primary;
  final Color error;
  final Color secondary;
  final Color buttonText;
  final Color textFieldBg;

  const AppColorsTheme({
    required this.appBackground,
    required this.error,
    required this.primary,
    required this.secondary,
    required this.buttonText,
    required this.textFieldBg,
  });
}
