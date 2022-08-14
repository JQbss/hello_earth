part of 'session_bloc.dart';

abstract class SessionState extends Equatable {
  const SessionState();

  bool get isSessionActive => (this is SessionActive);

  bool get isParent => (this as SessionActive).isParent;

  bool get isChild => !(this as SessionActive).isParent;

  @override
  List<dynamic> get props => [];
}

class SessionInitial extends SessionState {}

class SessionLoading extends SessionState {
  const SessionLoading();
}

class SessionActive extends SessionState {
  final bool isParent;
  final bool needsRegistration;
  final ParentModel? parentModel;

  const SessionActive({
    required this.isParent,
    required this.parentModel,
    required this.needsRegistration,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        isParent,
        needsRegistration,
        parentModel,
      ];
}

class SessionInactive extends SessionState {
  const SessionInactive();
}
