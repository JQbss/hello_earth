import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hello_earth/commons/text_field_data.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'sign_up_child_event.dart';

part 'sign_up_child_state.dart';

class SignUpChildBloc extends Bloc<SignUpChildEvent, SignUpChildState> {
  final TextFieldData emailTextFieldData = TextFieldData();
  final TextFieldData nameTextFieldData = TextFieldData();
  final TextFieldData passwordTextFieldData = TextFieldData();

  String? _familyId;

  SignUpChildBloc() : super(SignUpChildInitial()) {
    on<SignUpChildRequested>(_onSignUpChildRequested);
    on<QrCodeScanRequested>(_onQrCodeScanRequested);
  }

  Future<void> _onSignUpChildRequested(
    SignUpChildRequested event,
    Emitter<SignUpChildState> emit,
  ) async {
    print(emailTextFieldData.text);
  }

  void onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) {
      add(
        QrCodeScanRequested(
          qrCode: scanData.code,
        ),
      );
    });
  }

  Future<void> _onQrCodeScanRequested(
    QrCodeScanRequested event,
    Emitter<SignUpChildState> emit,
  ) async {
    if (event.qrCode == null) return;
    _familyId = event.qrCode;
    emit(
      QrCodeScanCompleted(),
    );
  }
}
