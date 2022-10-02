import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/generated/l10n.dart';
import 'package:hello_earth/modals/sign_up_succeed_dialog.dart';
import 'package:hello_earth/pages/authentication/sign_up/sign_up_parent/sign_up_parent_bloc.dart';
import 'package:hello_earth/pages/authentication/sign_up/widgets/sign_up_body.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/styles/app_dimensions.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';
import 'package:hello_earth/widgets/loading_button.dart';

class SignUpParentPage extends StatefulWidget {
  const SignUpParentPage({
    super.key,
  });

  @override
  State<SignUpParentPage> createState() => _SignUpParentPageState();
}

class _SignUpParentPageState
    extends BlocPageState<SignUpParentPage, SignUpParentBloc> {
  final GlobalKey _signUpButtonKey = GlobalKey();

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
    return SignUpBody(
      loginTextFieldData: bloc.loginTextFieldData,
      emailTextFieldData: bloc.emailTextFieldData,
      passwordTextFieldData: bloc.passwordTextFieldData,
      profileTitle: 'Profil: rodzic',
      onChanged: (_) => bloc.add(
        SignUpParentRequested(),
      ),
    );
  }

  Widget _buildSignUpParentButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding:
            EdgeInsets.all(AppDimensions.padding.buttonHorizontal).copyWith(
          bottom: AppDimensions.padding.buttonBottom,
          top: 0.0,
        ),
        child: LoadingButton(
          isLoading: bloc.state is SignUpInProgress,
          globalKey: _signUpButtonKey,
          child: AdaptiveButton(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppDimensions.radius.button),
            ),
            child: Text(
              S.of(context).signUp,
              style: TextStyle(
                color: AppColors.buttonText,
              ),
            ),
            onPressed: () => bloc.add(
              SignUpParentRequested(),
            ),
          ),
        ),
      ),
    );
  }
}
