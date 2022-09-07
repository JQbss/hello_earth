part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<dynamic> get props => [];
}

class SignInFailure extends SignInState {
  const SignInFailure();
}

class SignInInitial extends SignInState {
  const SignInInitial();
}

class SignInSuccess extends SignInState {
  const SignInSuccess();
}

class SignInViewChanged extends SignInState {
  final bool isFormEnabled;

  const SignInViewChanged({
    required this.isFormEnabled,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        isFormEnabled,
      ];
}
