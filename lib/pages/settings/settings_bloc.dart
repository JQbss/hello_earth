import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/session/session_bloc.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SessionBloc sessionBloc;

  SettingsBloc({
    required this.sessionBloc,
  }) : super(const SettingsInitial()) {
    on<SettingLogoutRequested>(_onSettingLogoutRequested);
  }

  Future<void> _onSettingLogoutRequested(
    SettingLogoutRequested event,
    Emitter<SettingsState> emit,
  ) async {
    sessionBloc.add(
      SessionLogOutRequested(),
    );
  }
}
