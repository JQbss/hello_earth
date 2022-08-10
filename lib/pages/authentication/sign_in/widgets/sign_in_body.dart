import 'package:flutter/material.dart';
import 'package:hello_earth/commons/text_field_data.dart';
import 'package:hello_earth/widgets/data_text_field.dart';

class SignInBody extends StatelessWidget {
  final TextFieldData emailTextFieldData;
  final TextFieldData passwordTextFieldData;
  const SignInBody({
    super.key,
    required this.emailTextFieldData,
    required this.passwordTextFieldData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildEmailTextField(context),
        _buildPasswordTextField(context),
      ],
    );
  }

  Widget _buildEmailTextField(BuildContext context){
    return DataTextField(emailTextFieldData);
  }
  Widget _buildPasswordTextField(BuildContext context) {
    return DataTextField(passwordTextFieldData);
  }
}
