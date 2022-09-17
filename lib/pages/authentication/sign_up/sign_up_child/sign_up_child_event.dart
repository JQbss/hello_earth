part of 'sign_up_child_bloc.dart';

abstract class SignUpChildEvent extends Equatable {
  const SignUpChildEvent();

  @override
  List<dynamic> get props => [];
}

class SignUpChildRequested extends SignUpChildEvent {
  const SignUpChildRequested();
}

class QrCodeScanRequested extends SignUpChildEvent {
  final String? qrCode;

  const QrCodeScanRequested({
    required this.qrCode,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        qrCode,
      ];
}
