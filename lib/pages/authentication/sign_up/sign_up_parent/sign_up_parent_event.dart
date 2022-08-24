part of 'sign_up_parent_bloc.dart';

abstract class SignUpParentEvent extends Equatable {
  const SignUpParentEvent();

  @override
  List<dynamic> get props => [];
}

class SignUpParentRequested extends SignUpParentEvent {
  const SignUpParentRequested();
}
