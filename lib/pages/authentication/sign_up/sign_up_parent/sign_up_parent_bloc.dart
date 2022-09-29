import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello_earth/commons/text_field_data.dart';
import 'package:hello_earth/errors/api_error_factory.dart';
import 'package:hello_earth/errors/app_error.dart';
import 'package:hello_earth/errors/error_keys.dart';
import 'package:hello_earth/networking/requests/credential_request.dart';
import 'package:hello_earth/networking/requests/role_request.dart';
import 'package:hello_earth/networking/requests/user_request.dart';
import 'package:hello_earth/repositories/credential/credential_repository.dart';
import 'package:hello_earth/repositories/user/user_repository.dart';
import 'package:hello_earth/utils/text_field_validators_util.dart';

import '../../../../errors/app_ui_error.dart';

part 'sign_up_parent_event.dart';

part 'sign_up_parent_state.dart';

class SignUpParentBloc extends Bloc<SignUpParentEvent, SignUpParentState> {
  final CredentialRepository credentialRepository;

  final TextFieldData loginTextFieldData = TextFieldData(
    (text) => TextFieldValidatorsUtil.validateLogin(text.trim()),
    errorKey: ErrorKeys.login,
  );
  final TextFieldData emailTextFieldData = TextFieldData(
    (text) => TextFieldValidatorsUtil.validateEmail(text.trim()),
    errorKey: ErrorKeys.email,
  );
  final TextFieldData passwordTextFieldData = TextFieldData(
    (text) => TextFieldValidatorsUtil.validatePassword(text.trim()),
    errorKey: ErrorKeys.password,
  );
  final UserRepository userRepository;

  SignUpParentBloc({
    required this.credentialRepository,
    required this.userRepository,
  }) : super(SignUpParentInitial()) {
    on<SignUpParentRequested>(_onSignUpParentRequested);
  }

  Future<void> _onSignUpParentRequested(
    SignUpParentRequested event,
    Emitter<SignUpParentState> emit,
  ) async {
    emit(
      SignUpInProgress(),
    );
    if (!_isFormValid()) {
      emit(
        SignUpFailure(),
      );
    }
    try {
      CredentialRequest credentialRequest = CredentialRequest(
        email: emailTextFieldData.text,
        password: passwordTextFieldData.text,
      );

      final User? user = (await credentialRepository.createUser(credentialRequest)).user;
      if (user == null) {
        return;
      }
      await user.sendEmailVerification();
      UserRequest userRequest = UserRequest(
        email: emailTextFieldData.text,
        familyId: user.uid,
        role: RoleRequest.parent,
        userName: loginTextFieldData.text,
      );
      await userRepository.addUser(
        user: userRequest,
        userId: user.uid,
      );
      await credentialRepository.signOut();
      emit(
        SignUpParentSuccess(),
      );
    } catch (error) {
      final FirebaseError? firebaseError = ApiErrorFactory.provideFirebaseAuthError(error);
      if (firebaseError != null) {
        TextFieldData.forceFirebaseErrors(
          [
            emailTextFieldData,
            loginTextFieldData,
            passwordTextFieldData,
          ],
          apiError: firebaseError,
        );
      }
      emit(
        SignUpFailure(),
      );
    }
  }

  bool _isFormValid() {
    return TextFieldData.validateTextFieldsAndCheckIfAreValid(
      [
        loginTextFieldData,
        emailTextFieldData,
        passwordTextFieldData,
      ],
      forceErrorIfInvalid: true,
    );
  }
}
