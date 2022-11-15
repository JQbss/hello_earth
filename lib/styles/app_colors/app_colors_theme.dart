import 'package:flutter/material.dart';

abstract class AppColorsTheme {
  final Color appBackground;
  final Color buttonText;
  final Color bezierCurveSecondary;
  final Color error;
  final Color disabled;
  final Color disabledMission;
  final Color levelLogo;
  final Color levelLogoText;
  final Color primary;
  final Color secondary;
  final Color textFieldBackground;

  const AppColorsTheme({
    required this.appBackground,
    required this.buttonText,
    required this.bezierCurveSecondary,
    required this.disabled,
    required this.disabledMission,
    required this.error,
    required this.levelLogo,
    required this.levelLogoText,
    required this.primary,
    required this.secondary,
    required this.textFieldBackground,
  });
}
