import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello_earth/commons/text_field_data.dart';
import 'package:hello_earth/networking/requests/credential_request.dart';
import 'package:hello_earth/networking/requests/role_request.dart';
import 'package:hello_earth/networking/requests/user_request.dart';
import 'package:hello_earth/repositories/credential/credential_repository.dart';
import 'package:hello_earth/repositories/user/user_repository.dart';

part 'sign_up_parent_event.dart';

part 'sign_up_parent_state.dart';

class SignUpParentBloc extends Bloc<SignUpParentEvent, SignUpParentState> {
  final CredentialRepository credentialRepository;
  final TextFieldData emailTextFieldData = TextFieldData();
  final TextFieldData nameTextFieldData = TextFieldData();
  final TextFieldData passwordTextFieldData = TextFieldData();
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
        userName: nameTextFieldData.text,
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
      print(error);
    }
  }
}
