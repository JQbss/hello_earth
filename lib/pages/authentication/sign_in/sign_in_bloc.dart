import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello_earth/commons/text_field_data.dart';
import 'package:hello_earth/commons/unique_prop_provider.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  bool isFormEnabled;
  final TextFieldData emailTextFieldData = TextFieldData();
  final TextFieldData passwordTextFieldData = TextFieldData();

  SignInBloc({
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
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextFieldData.text,
        password: passwordTextFieldData.text,
      );
      print(credential);
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
