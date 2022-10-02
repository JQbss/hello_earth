part of 'sign_up_child_bloc.dart';

abstract class SignUpChildState extends Equatable {
  const SignUpChildState();

  List<dynamic> get props => [];
}

class SignUpChildOnBoardClosed extends SignUpChildState {
  const SignUpChildOnBoardClosed();
}

class SignUpInProgress extends SignUpChildState {
  const SignUpInProgress();
}

class SignUpFailure extends SignUpChildState {
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

class SignUpChildInitial extends SignUpChildState {
  const SignUpChildInitial();
}

class SignUpChildSuccess extends SignUpChildState {
  const SignUpChildSuccess();
}

class QrCodeScanCompleted extends SignUpChildState {
  const QrCodeScanCompleted();
}
