import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/generated/l10n.dart';
import 'package:hello_earth/modals/sign_up_succeed_dialog.dart';
import 'package:hello_earth/pages/authentication/sign_up/sign_up_parent/sign_up_parent_bloc.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/styles/app_dimensions.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';
import 'package:hello_earth/widgets/data_text_field.dart';

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
        DataTextField(
          bloc.nameTextFieldData,
          hintText: S.of(context).textFieldLoginHint,
          labelText: S.of(context).textFieldLoginLabel,
        ),
        SizedBox(
          height: 20,
        ),
        DataTextField(
          bloc.emailTextFieldData,
          hintText: S.of(context).textFieldEmailHint,
          labelText: S.of(context).textFieldEmailLabel,
        ),
        SizedBox(
          height: 20,
        ),
        DataTextField(
          bloc.passwordTextFieldData,
          hintText: S.of(context).textFieldPasswordHint,
          labelText: S.of(context).textFieldPasswordLabel,
          obscureText: true,
        ),
      ],
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
