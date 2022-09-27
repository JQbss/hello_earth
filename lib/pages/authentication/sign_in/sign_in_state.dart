part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<dynamic> get props => [];
}

class SignInFailure extends SignInState {
  final AppUiError? appUiError;

  const SignInFailure({
    this.appUiError,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        appUiError,
      ];
}

class SignInEmailSent extends SignInState {
  const SignInEmailSent();
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

class SignInDataInputUpdated extends SignInState {
  final bool dataChanged;

  const SignInDataInputUpdated({
    required this.dataChanged,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        dataChanged,
      ];
}
