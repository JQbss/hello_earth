part of 'sign_up_child_bloc.dart';

abstract class SignUpChildEvent extends Equatable {
  const SignUpChildEvent();

  @override
  List<dynamic> get props => [];
}

class SignUpChildRequested extends SignUpChildEvent {
  const SignUpChildRequested();
}
