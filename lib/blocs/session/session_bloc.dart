import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello_earth/blocs/configuration/configuration_bloc.dart';
import 'package:hello_earth/commons/unique_prop_provider.dart';
import 'package:hello_earth/networking/models/base_response.dart';
import 'package:hello_earth/networking/models/role.dart';
import 'package:hello_earth/networking/models/user_networking.dart';
import 'package:hello_earth/repositories/credential/credential_repository.dart';
import 'package:hello_earth/repositories/user/user_repository.dart';

part 'session_event.dart';

part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final ConfigurationBloc configurationBloc;
  final CredentialRepository credentialRepository;
  UserNetworking? user;
  final UserRepository userRepository;

  SessionBloc({
    required this.configurationBloc,
    required this.credentialRepository,
    this.user = null,
    required this.userRepository,
  }) : super(SessionInitial()) {
    on<SessionAuthenticationSucceed>(_onSessionAuthenticationSucceed);
    on<SessionStatusRequested>(_onSessionStatusRequested);
    on<SessionLogOutRequested>(_onSessionLogOutRequested);
  }

  bool isChild() {
    return user?.role == Role.child;
  }

  bool isParent() {
    return user?.role == Role.parent;
  }

  Future<void> _onSessionAuthenticationSucceed(
    SessionAuthenticationSucceed event,
    Emitter<SessionState> emit,
  ) async {
    return Future.value();
  }

  Future<void> _onSessionStatusRequested(
    SessionStatusRequested event,
    Emitter<SessionState> emit,
  ) async {
    emit(
      SessionInitial(),
    );
    User? firebaseUser = credentialRepository.currentFirebaseUser();
    if (firebaseUser != null) {
      final BaseResponse<UserNetworking> userResponse = await userRepository.me(
        userId: firebaseUser.uid,
      );
      user = userResponse.data;
      if (user?.role == Role.child) {
        configurationBloc.add(
          ConfigurationCheckPlayerRequested(
            familyId: user?.familyId ?? '',
          ),
        );
        emit(
          SessionChildActive(),
        );
      } else {
        configurationBloc.add(
          ConfigurationCheckParentRequested(
            parentUid: user?.familyId ?? '',
          ),
        );
        emit(
          SessionParentActive(),
        );
      }
    } else {
      emit(
        SessionInactive(),
      );
    }
  }

  Future<void> _onSessionLogOutRequested(
    SessionLogOutRequested event,
    Emitter<SessionState> emit,
  ) async {
    emit(
      SessionInactive(),
    );
  }
}
