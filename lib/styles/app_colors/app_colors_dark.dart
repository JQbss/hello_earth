import 'package:flutter/material.dart';
import 'package:hello_earth/styles/app_colors/app_colors_theme.dart';

class AppColorsDark extends AppColorsTheme {
  AppColorsDark()
      : super(
          appBackground: const Color(0xFFDCE6AB),
          buttonText: Colors.white,
          bezierCurveSecondary: const Color(0xFFD4A8B4),
          disabled: const Color(0xFFEDEDED),
          error: const Color(0xFFB00020),
          levelLogo: const Color(0xFF5A482F),
          levelLogoText: const Color(0xFFD9D3CC),
          primary: const Color(0xFF7F1F55),
          secondary: const Color(0xFFA4AD40),
          textFieldBackground: Colors.white,
        );
}
