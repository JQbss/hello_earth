import 'package:flutter/material.dart';
import 'package:hello_earth/styles/app_colors/app_colors_theme.dart';

class AppColorsDark extends AppColorsTheme {
  AppColorsDark()
      : super(
          appBackground: const Color(0xFFDCE6AB),
          error: Color(0xFFB00020),
          primary: Color(0xFF7F1F55),
          secondary: Color(0xFFA4AD40),
          buttonText: Colors.white,
        );
}
