import 'package:flutter/material.dart';
import 'package:hello_earth/styles/app_colors/app_colors_theme.dart';

class AppColorsLight extends AppColorsTheme {
  AppColorsLight()
      : super(
          appBackground: const Color(0xFFD6E2B3),
          buttonText: Colors.white,
          disabled: Color(0xFFEDEDED),
          error: Color(0xFFB00020),
          levelLogo: Color(0xFF5A482F),
          levelLogoText: Color(0xFFD9D3CC),
          primary: Color(0xFF7F1F55),
          textFieldBackground: Colors.white,
          secondary: Color(0xFFA4AD40),
        );
}
