import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello_earth/commons/text_field_data.dart';

part 'sign_up_parent_event.dart';

part 'sign_up_parent_state.dart';

class SignUpParentBloc extends Bloc<SignUpParentEvent, SignUpParentState> {
  final TextFieldData emailTextFieldData = TextFieldData();
  final TextFieldData nameTextFieldData = TextFieldData();
  final TextFieldData passwordTextFieldData = TextFieldData();

  SignUpParentBloc() : super(SignUpParentInitial()) {
    on<SignUpParentRequested>(_onSignUpParentRequested);
  }

  Future<void> _onSignUpParentRequested(
    SignUpParentRequested event,
    Emitter<SignUpParentState> emit,
  ) async {
    print(emailTextFieldData.text);
    print(nameTextFieldData.text);
    print(passwordTextFieldData.text);
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextFieldData.text,
        password: passwordTextFieldData.text,
      );
      emit(
        SignUpParentSuccess(),
      );
    } catch (error) {
      print(error);
    }
  }
}
