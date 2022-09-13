import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/generated/l10n.dart';
import 'package:hello_earth/pages/authentication/sign_up/sign_up_child/sign_up_child_bloc.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';
import 'package:hello_earth/widgets/data_text_field.dart';

class SignUpChildPage extends StatefulWidget {
  const SignUpChildPage({
    super.key,
  });

  @override
  State<SignUpChildPage> createState() => _SignUpChildPageState();
}

class _SignUpChildPageState
    extends BlocPageState<SignUpChildPage, SignUpChildBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpChildBloc, SignUpChildState>(
      builder: (context, state) {
        return Scaffold(
          body: _buildBody(),
        );
      },
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        DataTextField(
          bloc.nameTextFieldData,
          labelText: S.of(context).textFieldLoginLabel,
          hintText: S.of(context).textFieldLoginHint,
        ),
        DataTextField(
          bloc.emailTextFieldData,
          labelText: S.of(context).textFieldEmailLabel,
          hintText: S.of(context).textFieldEmailHint,
        ),
        DataTextField(
          bloc.passwordTextFieldData,
          labelText: S.of(context).textFieldPasswordLabel,
          hintText: S.of(context).textFieldPasswordHint,
        ),
        _buildSignUpChild(),
      ],
    );
  }

  Widget _buildSignUpChild() {
    return AdaptiveButton(
      child: Container(
        child: Text(
          S.of(context).signUp,
        ),
      ),
      onPressed: () => {},
    );
  }
}
