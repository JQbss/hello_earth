import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello_earth/commons/text_field_data.dart';
import 'package:hello_earth/commons/unique_prop_provider.dart';
import 'package:hello_earth/networking/models/base_response.dart';
import 'package:hello_earth/networking/models/role.dart';
import 'package:hello_earth/networking/models/user_networking.dart';
import 'package:hello_earth/networking/requests/credential_request.dart';
import 'package:hello_earth/repositories/credential/credential_repository.dart';
import 'package:hello_earth/repositories/user/user_repository.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final CredentialRepository credentialRepository;
  final UserRepository userRepository;
  bool isFormEnabled;
  final TextFieldData emailTextFieldData = TextFieldData();
  final TextFieldData passwordTextFieldData = TextFieldData();

  SignInBloc({
    required this.credentialRepository,
    required this.userRepository,
    required this.isFormEnabled,
  }) : super(SignInInitial()) {
    on<SignInViewChangeRequested>(_onSignInViewChangeRequested);
    on<SignInWithEmailRequested>(_onSignInWithEmailRequested);
  }

  Future<void> _onSignInWithEmailRequested(
    SignInWithEmailRequested event,
    Emitter<SignInState> emit,
  ) async {
    print(emailTextFieldData.text);
    print(passwordTextFieldData.text);
    try {
      CredentialRequest credentialRequest = CredentialRequest(
        email: emailTextFieldData.text,
        password: passwordTextFieldData.text,
      );
      final User? userCredential = (await credentialRepository.signInUser(credentialRequest)).user;
      if (userCredential == null) {
        return;
      }
      final BaseResponse<UserNetworking> userResponse = await userRepository.me(
        userId: userCredential.uid,
      );
      final UserNetworking user = userResponse.data;
      if (user.role == Role.parent && !userCredential.emailVerified) {
        credentialRepository.signOut();
        return;
      }
    } catch (error) {
      print(error);
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
}
