import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/theme/theme_bloc.dart';
import 'package:hello_earth/injector/injector.dart';
import 'package:hello_earth/pages/navigators/global_navigator.dart';
import 'package:hello_earth/styles/app_colors/app_colors_light.dart';
import 'package:hello_earth/styles/app_colors/app_colors_theme.dart';

class AppColors {
  static late AppColorsTheme colors = _initColors();

  const AppColors._();

  static Color get appBackground => colors.appBackground;

  static Color get buttonText => colors.buttonText;

  static Color get bezierCurveSecondary => colors.bezierCurveSecondary;

  static Color get disabled => colors.disabled;

  static Color get disabledMission => colors.disabledMission;

  static Color get error => colors.error;

  static Color get levelLogo => colors.levelLogo;

  static Color get levelLogoText => colors.levelLogoText;

  static Color get primary => colors.primary;

  static Color get secondary => colors.secondary;

  static Color get textFieldBackground => colors.textFieldBackground;

  static AppColorsTheme _initColors() {
    final BuildContext? context =
        Injector().get<GlobalNavigator>().currentContext;
    if (context == null) {
      return AppColorsLight();
    }
    return BlocProvider.of<ThemeBloc>(context).colors;
  }
}
