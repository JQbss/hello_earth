part of 'session_bloc.dart';

abstract class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<dynamic> get props => [];
}

class CreateSessionRequested extends SessionEvent {
  final bool isChild;
  final bool isParent;
  final String token;

  const CreateSessionRequested({
    required this.isChild,
    required this.isParent,
    required this.token,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        isChild,
        isParent,
        token,
      ];
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
