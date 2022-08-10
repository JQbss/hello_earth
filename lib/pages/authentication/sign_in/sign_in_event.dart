part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<dynamic> get props => [];
}

class SignInWithEmailRequested extends SignInEvent {
  SignInWithEmailRequested();

  @override
  List<dynamic> get props => [
        ...super.props,
        UniquePropProvider.get(),
      ];
}
