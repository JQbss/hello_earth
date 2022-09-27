import 'package:flutter/material.dart';
import 'package:hello_earth/commons/text_field_data.dart';
import 'package:hello_earth/generated/l10n.dart';
import 'package:hello_earth/widgets/data_text_field.dart';

import '../../../../../styles/app_colors/app_colors.dart';

class SignUpBody extends StatelessWidget {
  final TextFieldData loginTextFieldData;
  final TextFieldData emailTextFieldData;
  final TextFieldData passwordTextFieldData;
  final void Function(String)? onChanged;

  const SignUpBody({
    super.key,
    required this.loginTextFieldData,
    required this.emailTextFieldData,
    required this.passwordTextFieldData,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: Text(
              'Profil: rodzic',
              style: TextStyle(
                color: AppColors.primary,
                letterSpacing: 1.5,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        _buildLoginTextField(context),
        const SizedBox(
          height: 20,
        ),
        _buildEmailTextField(context),
        const SizedBox(
          height: 20,
        ),
        _buildPasswordTextField(context),
      ],
    );
  }

  Widget _buildLoginTextField(BuildContext context) {
    return DataTextField(
      loginTextFieldData,
      labelText: S.of(context).textFieldLoginLabel,
      hintText: S.of(context).textFieldLoginHint,
      onChanged: onChanged,
      onSubmitted: () => FocusScope.of(context).requestFocus(loginTextFieldData.focusNode),
    );
  }

  Widget _buildEmailTextField(BuildContext context) {
    return DataTextField(
      emailTextFieldData,
      labelText: S.of(context).textFieldEmailLabel,
      hintText: S.of(context).textFieldEmailHint,
      onChanged: onChanged,
      onSubmitted: () => FocusScope.of(context).requestFocus(emailTextFieldData.focusNode),
    );
  }

  Widget _buildPasswordTextField(BuildContext context) {
    return DataTextField(
      passwordTextFieldData,
      labelText: S.of(context).textFieldPasswordLabel,
      hintText: S.of(context).textFieldPasswordHint,
      obscureText: true,
      onSubmitted: () => FocusScope.of(context).requestFocus(passwordTextFieldData.focusNode),
    );
  }
}
