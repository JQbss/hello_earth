part of 'sign_up_parent_bloc.dart';

abstract class SignUpParentState extends Equatable {
  const SignUpParentState();

  @override
  List<dynamic> get props => [];
}

class SignUpParentInitial extends SignUpParentState {
  const SignUpParentInitial();
}

class SignUpInProgress extends SignUpParentState {
  const SignUpInProgress();
}

class SignUpParentSuccess extends SignUpParentState {
  const SignUpParentSuccess();
}

class SignUpFailure extends SignUpParentState {
  final AppUiError? appUiError;

  const SignUpFailure({
    this.appUiError,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        appUiError,
      ];
}
