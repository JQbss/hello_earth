import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hello_earth/storages/session_storage.dart';
import 'package:hello_earth/ui/models/parent_model.dart';

part 'session_event.dart';

part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final SessionStorage sessionStorage;

  SessionBloc({
    required this.sessionStorage,
  }) : super(SessionInitial()) {
    on<SessionAuthenticationSucceed>(_onSessionAuthenticationSucceed);
    on<SessionStatusRequested>(_onSessionStatusRequested);
    on<SessionLogOutRequested>(_onSessionLogOutRequested);
  }

  Future<void> _onSessionAuthenticationSucceed(
    SessionAuthenticationSucceed event,
    Emitter<SessionState> emit,
  ) {
    return Future.value();
  }

  Future<void> _onSessionStatusRequested(
    SessionStatusRequested event,
    Emitter<SessionState> emit,
  ) {
    return Future.value();
  }

  Future<void> _onSessionLogOutRequested(
    SessionLogOutRequested event,
    Emitter<SessionState> emit,
  ) {
    return Future.value();
  }
}
