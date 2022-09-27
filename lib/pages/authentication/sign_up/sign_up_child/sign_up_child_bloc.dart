import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello_earth/commons/text_field_data.dart';
import 'package:hello_earth/errors/error_keys.dart';
import 'package:hello_earth/networking/requests/credential_request.dart';
import 'package:hello_earth/networking/requests/player_request.dart';
import 'package:hello_earth/networking/requests/role_request.dart';
import 'package:hello_earth/networking/requests/user_request.dart';
import 'package:hello_earth/repositories/credential/credential_repository.dart';
import 'package:hello_earth/repositories/family/family_repository.dart';
import 'package:hello_earth/repositories/user/user_repository.dart';
import 'package:hello_earth/utils/text_field_validators_util.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'sign_up_child_event.dart';

part 'sign_up_child_state.dart';

class SignUpChildBloc extends Bloc<SignUpChildEvent, SignUpChildState> {
  final CredentialRepository credentialRepository;
  final TextFieldData emailTextFieldData = TextFieldData(
    (text) => TextFieldValidatorsUtil.validateEmail(text.trim()),
    errorKey: ErrorKeys.email,
  );
  final FamilyRepository familyRepository;
  final TextFieldData nameTextFieldData = TextFieldData(
    (text) => TextFieldValidatorsUtil.validateLogin(text.trim()),
    errorKey: ErrorKeys.email,
  );
  final TextFieldData passwordTextFieldData = TextFieldData(
    (text) => TextFieldValidatorsUtil.validatePassword(text.trim()),
    errorKey: ErrorKeys.password,
  );
  final UserRepository userRepository;

  String? _familyId;

  SignUpChildBloc({
    required this.credentialRepository,
    required this.familyRepository,
    required this.userRepository,
  }) : super(SignUpChildInitial()) {
    on<SignUpChildRequested>(_onSignUpChildRequested);
    on<QrCodeScanRequested>(_onQrCodeScanRequested);
  }

  Future<void> _onSignUpChildRequested(
    SignUpChildRequested event,
    Emitter<SignUpChildState> emit,
  ) async {
    try {
      CredentialRequest credentialRequest = CredentialRequest(
        email: emailTextFieldData.text.toLowerCase(),
        password: passwordTextFieldData.text,
      );
      final User? user =
          (await credentialRepository.createUser(credentialRequest)).user;
      final String? familyId = _familyId;
      if (user == null) {
        return;
      }
      if (familyId == null) {
        await credentialRepository.signOut();
        return;
      }
      UserRequest userRequest = UserRequest(
        email: emailTextFieldData.text.toLowerCase(),
        familyId: familyId,
        role: RoleRequest.child,
        userName: nameTextFieldData.text,
      );
      await userRepository.addUser(
        user: userRequest,
        userId: user.uid,
      );
      PlayerRequest playerRequest = PlayerRequest(
        uid: user.uid,
      );
      await familyRepository.addPlayer(
        familyId: familyId,
        playerRequest: playerRequest,
      );
      emit(
        SignUpChildSuccess(),
      );
    } catch (error) {
      print(error);
    }
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
