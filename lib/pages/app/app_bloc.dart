import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hello_earth/commons/unique_prop_provider.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppColors colors;
  String test;

  AppBloc({
    required this.colors,
    required this.test,
  }) : super(AppInitial()) {
    on<ChangeThemeRequestedAppEvent>(_onChangeThemeRequestedAppEvent);
  }

  Future<void> _onChangeThemeRequestedAppEvent(
    ChangeThemeRequestedAppEvent event,
    Emitter<AppState> emit,
  ) async {
    colors = event.colors;
    test = event.test;
    emit(
      ThemeChanged(
        colors: colors,
        test: test,
      ),
    );
  }
}
