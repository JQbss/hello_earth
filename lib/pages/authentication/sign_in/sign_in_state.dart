part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<dynamic> get props => [];
}

class SignInInitial extends SignInState {
  const SignInInitial();
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
