part of 'session_bloc.dart';

abstract class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<dynamic> get props => [];
}

class SessionAuthenticationSucceed extends SessionEvent {
  const SessionAuthenticationSucceed();
}

class SessionStatusRequested extends SessionEvent {
  const SessionStatusRequested();
}

class SessionLogOutRequested extends SessionEvent {
  SessionLogOutRequested();
}
