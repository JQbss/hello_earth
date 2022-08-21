import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/styles/app_colors/app_colors_theme.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  AppColorsTheme colors;
  String themeName;

  ThemeBloc({
    required this.colors,
    required this.themeName,
  }) : super(ThemeInitial()) {
    on<ChangeThemeRequested>(_onChangeThemeRequested);
  }

  Future<void> _onChangeThemeRequested(
    ChangeThemeRequested event,
    Emitter<ThemeState> emit,
  ) async {
    colors = event.colors;
    themeName = event.themeName;
    AppColors.colors = event.colors;
    emit(
      ThemeChanged(
        colors: colors,
        themeName: themeName,
      ),
    );
  }
}
