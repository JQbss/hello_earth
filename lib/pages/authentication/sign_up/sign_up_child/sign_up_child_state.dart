part of 'sign_up_child_bloc.dart';

abstract class SignUpChildState extends Equatable {
  const SignUpChildState();

  List<dynamic> get props => [];
}

class SignUpChildOnBoardClosed extends SignUpChildState {
  const SignUpChildOnBoardClosed();
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
