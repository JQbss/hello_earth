import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/generated/l10n.dart';
import 'package:hello_earth/pages/authentication/sign_up/sign_up_parent/sign_up_parent_bloc.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';
import 'package:hello_earth/widgets/data_text_field.dart';

class SignUpParentPage extends StatefulWidget {
  const SignUpParentPage({
    super.key,
  });

  @override
  State<SignUpParentPage> createState() => _SignUpParentPageState();
}

class _SignUpParentPageState extends BlocPageState<SignUpParentPage, SignUpParentBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpParentBloc, SignUpParentState>(
      listener: _onStateChange,
      builder: (context, state) {
        return Scaffold(
          body: _buildBody(),
        );
      },
    );
  }

  void _onStateChange(
    BuildContext context,
    SignUpParentState state,
  ) {
    if (state is SignUpParentSuccess) {
      Navigator.pop(context);
    }
  }

  Widget _buildBody() {
    return Column(
      children: [
        DataTextField(bloc.nameTextFieldData),
        DataTextField(bloc.emailTextFieldData),
        DataTextField(bloc.passwordTextFieldData),
        _buildSignUpParent(),
      ],
    );
  }

  Widget _buildSignUpParent() {
    return AdaptiveButton(
      child: Container(
        child: Text(
          S.of(context).signUp,
        ),
      ),
      onPressed: () => bloc.add(
        SignUpParentRequested(),
      ),
    );
  }
}
