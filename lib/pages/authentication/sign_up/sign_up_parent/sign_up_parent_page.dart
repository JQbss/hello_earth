import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/generated/l10n.dart';
import 'package:hello_earth/modals/sign_up_succeed_dialog.dart';
import 'package:hello_earth/pages/authentication/sign_up/sign_up_parent/sign_up_parent_bloc.dart';
import 'package:hello_earth/pages/authentication/sign_up/sign_up_parent/widgets/sign_up_body.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/styles/app_dimensions.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';

import '../../../../commons/text_field_data.dart';

class SignUpParentPage extends StatefulWidget {
  const SignUpParentPage({
    super.key,
  });

  @override
  State<SignUpParentPage> createState() => _SignUpParentPageState();
}

class _SignUpParentPageState
    extends BlocPageState<SignUpParentPage, SignUpParentBloc> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpParentBloc, SignUpParentState>(
      listener: _onStateChange,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.appBackground,
          body: _buildBody(),
        );
      },
    );
  }

  void _onStateChange(
    BuildContext context,
    SignUpParentState state,
  ) async {
    if (state is SignUpParentSuccess) {
      await SignUpSucceedDialog.show(context);
      Navigator.pop(context);
    }
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: SizedBox.shrink(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Container(
                  child: Column(
                    children: [
                      _buildSignUpParentBody(),
                    ],
                  ),
                ),
              ),
            ),
            _buildSignUpParentButton(),
          ],
        ),
      ),
    );
  }
  Widget _buildSignUpParentBody() {
    return  SignUpBody(
        loginTextFieldData: bloc.loginTextFieldData,
        emailTextFieldData: bloc.emailTextFieldData,
        passwordTextFieldData: bloc.passwordTextFieldData,
        onChanged: (_) => bloc.add(
          SignUpParentRequested(),
        ),
      );
  }

  Widget _buildSignUpParentButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: AdaptiveButton(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppDimensions.radius.button),
            ),
            child: Center(
              child: Text(
                S.of(context).signUp,
                style: TextStyle(
                  color: AppColors.buttonText,
                ),
              ),
            ),
            width: AppDimensions.width.button,
            height: AppDimensions.height.button,
          ),
          onPressed: () => bloc.add(
            SignUpParentRequested(),
          ),
        ),
      ),
    );
  }
}
