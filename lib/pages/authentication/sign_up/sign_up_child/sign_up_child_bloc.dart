import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hello_earth/commons/text_field_data.dart';

part 'sign_up_child_event.dart';

part 'sign_up_child_state.dart';

class SignUpChildBloc extends Bloc<SignUpChildEvent, SignUpChildState> {
  final TextFieldData emailTextFieldData = TextFieldData();
  final TextFieldData nameTextFieldData = TextFieldData();
  final TextFieldData passwordTextFieldData = TextFieldData();

  SignUpChildBloc() : super(SignUpChildInitial()) {
    on<SignUpChildRequested>(_onSignUpChildRequested);
  }

  Future<void> _onSignUpChildRequested(
    SignUpChildRequested event,
    Emitter<SignUpChildState> emit,
  ) async {
    print(emailTextFieldData.text);
  }
}
