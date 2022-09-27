part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<dynamic> get props => [];
}

class SignInSendEmailRequested extends SignInEvent {
  const SignInSendEmailRequested();
}

class SignInViewChangeRequested extends SignInEvent {
  final bool isFormEnabled;

  const SignInViewChangeRequested({
    required this.isFormEnabled,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        isFormEnabled,
      ];
}

class SignInWithEmailRequested extends SignInEvent {
  SignInWithEmailRequested();

  @override
  List<dynamic> get props => [
        ...super.props,
        UniquePropProvider.get(),
      ];
}

class SignInDataTextFieldChanged extends SignInEvent {
  const SignInDataTextFieldChanged();
}
