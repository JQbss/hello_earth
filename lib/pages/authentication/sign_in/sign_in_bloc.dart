import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello_earth/commons/text_field_data.dart';
import 'package:hello_earth/commons/unique_prop_provider.dart';
import 'package:hello_earth/errors/api_error_factory.dart';
import 'package:hello_earth/errors/app_error.dart';
import 'package:hello_earth/errors/app_ui_error.dart';
import 'package:hello_earth/errors/error_keys.dart';
import 'package:hello_earth/networking/models/base_response.dart';
import 'package:hello_earth/networking/models/role.dart';
import 'package:hello_earth/networking/models/user_networking.dart';
import 'package:hello_earth/networking/requests/credential_request.dart';
import 'package:hello_earth/repositories/credential/credential_repository.dart';
import 'package:hello_earth/repositories/user/user_repository.dart';
import 'package:hello_earth/utils/text_field_validators_util.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final CredentialRepository credentialRepository;
  final UserRepository userRepository;
  bool isFormEnabled;
  final TextFieldData emailTextFieldData = TextFieldData(
    (text) => TextFieldValidatorsUtil.validateEmail(text.trim()),
    errorKey: ErrorKeys.email,
  );
  final TextFieldData passwordTextFieldData = TextFieldData(
    (text) => TextFieldValidatorsUtil.validatePassword(text.trim()),
    errorKey: ErrorKeys.password,
  );

  SignInBloc({
    required this.credentialRepository,
    required this.userRepository,
    required this.isFormEnabled,
  }) : super(SignInInitial()) {
    on<SignInSendEmailRequested>(_onSignInSendEmailRequested);
    on<SignInViewChangeRequested>(_onSignInViewChangeRequested);
    on<SignInWithEmailRequested>(_onSignInWithEmailRequested);
    on<SignInDataTextFieldChanged>(_onSignInDataTextFieldChanged);
  }

  Future<void> _onSignInSendEmailRequested(
    SignInSendEmailRequested event,
    Emitter<SignInState> emit,
  ) async {

    CredentialRequest credentialRequest = CredentialRequest(
      email: emailTextFieldData.text,
      password: passwordTextFieldData.text,
    );
    final User? user = (await credentialRepository.signInUser(credentialRequest)).user;
    if (user == null) {
      return;
    }
    await user.sendEmailVerification();
    await credentialRepository.signOut();
    emit(
      SignInEmailSent(),
    );
  }

  Future<void> _onSignInWithEmailRequested(
    SignInWithEmailRequested event,
    Emitter<SignInState> emit,
  ) async {
    emit(
      SignInInProgress(),
    );
    if (!_isFormValid()) {
      emit(
        SignInFailure(),
      );
      return;
    }
    try {
      CredentialRequest credentialRequest = CredentialRequest(
        email: emailTextFieldData.text,
        password: passwordTextFieldData.text,
      );
      final UserCredential userCredential = await credentialRepository.signInUser(credentialRequest);
      final User? firebaseUser = userCredential.user;
      if (firebaseUser == null) {
        emit(
          SignInFailure(),
        );
        return;
      }
      final BaseResponse<UserNetworking> userResponse = await userRepository.me(
        userId: firebaseUser.uid,
      );
      final UserNetworking user = userResponse.data;
      if (user.role == Role.parent && !firebaseUser.emailVerified) {
        credentialRepository.signOut();
        emit(
          SignInFailure(
            appUiError: SignInEmailError(),
          ),
        );
        return;
      }
      emit(
        SignInSuccess(),
      );
    } catch (error) {
      final FirebaseError? firebaseError = ApiErrorFactory.provideFirebaseAuthError(error);
      if (firebaseError != null) {
        TextFieldData.forceFirebaseErrors(
          [
            emailTextFieldData,
            passwordTextFieldData,
          ],
          apiError: firebaseError,
        );
      }
      emit(
        SignInFailure(),
      );
    }
  }

  Future<void> _onSignInViewChangeRequested(
    SignInViewChangeRequested event,
    Emitter<SignInState> emit,
  ) async {
    isFormEnabled = event.isFormEnabled;
    emit(
      SignInViewChanged(
        isFormEnabled: isFormEnabled,
      ),
    );
  }

  Future<void> _onSignInDataTextFieldChanged(
    SignInDataTextFieldChanged event,
    Emitter<SignInState> emit,
  ) async {
    emit(
      SignInDataInputUpdated(
        dataChanged: true,
      ),
    );
  }

  bool _isFormValid() {
    return TextFieldData.validateTextFieldsAndCheckIfAreValid(
      [
        emailTextFieldData,
        passwordTextFieldData,
      ],
      forceErrorIfInvalid: true,
    );
  }
}
