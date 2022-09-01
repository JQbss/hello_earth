part of 'session_bloc.dart';

abstract class SessionState extends Equatable {
  const SessionState();

  @override
  List<dynamic> get props => [];
}

class SessionInitial extends SessionState {
  const SessionInitial();
}

class SessionChildActive extends SessionState {
  const SessionChildActive();

  @override
  List<dynamic> get props => [
        ...super.props,
        UniquePropProvider.get(),
      ];
}

class SessionParentActive extends SessionState {
  const SessionParentActive();

  @override
  List<dynamic> get props => [
        ...super.props,
        UniquePropProvider.get(),
      ];
}

class SessionInactive extends SessionState {
  const SessionInactive();
}
