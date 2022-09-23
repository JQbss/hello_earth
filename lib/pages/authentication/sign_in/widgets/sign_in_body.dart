import 'package:flutter/material.dart';
import 'package:hello_earth/commons/text_field_data.dart';
import 'package:hello_earth/generated/l10n.dart';
import 'package:hello_earth/widgets/data_text_field.dart';

class SignInBody extends StatelessWidget {
  final TextFieldData emailTextFieldData;
  final TextFieldData passwordTextFieldData;
  final void Function(String)? onChanged;

  const SignInBody({
    super.key,
    required this.emailTextFieldData,
    required this.passwordTextFieldData,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildEmailTextField(context),
        const SizedBox(
          height: 40,
        ),
        _buildPasswordTextField(context),
      ],
    );
  }

  Widget _buildEmailTextField(BuildContext context) {
    return DataTextField(
      emailTextFieldData,
      labelText: S.of(context).textFieldEmailLabel,
      hintText: S.of(context).textFieldEmailHint,
      onChanged: onChanged,
    );
  }

  Widget _buildPasswordTextField(BuildContext context) {
    return DataTextField(
      passwordTextFieldData,
      labelText: S.of(context).textFieldPasswordLabel,
      hintText: S.of(context).textFieldPasswordHint,
      obscureText: true,
    );
  }
}
