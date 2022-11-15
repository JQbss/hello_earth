import 'package:flutter/material.dart';
import 'package:hello_earth/styles/app_colors/app_colors_theme.dart';

class AppColorsLight extends AppColorsTheme {
  AppColorsLight()
      : super(
          appBackground: const Color(0xFFD6E2B3),
          buttonText: Colors.white,
          bezierCurveSecondary: const Color(0xFFD4A8B4),
          disabled: const Color(0xFFEDEDED),
          error: const Color(0xFFB00020),
          levelLogo: const Color(0xFF5A482F),
          levelLogoText: const Color(0xFFD9D3CC),
          primary: const Color(0xFF7F1F55),
          textFieldBackground: Colors.white,
          secondary: const Color(0xFFA4AD40),
        );
}
