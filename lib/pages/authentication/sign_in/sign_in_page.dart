import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/theme/theme_bloc.dart';
import 'package:hello_earth/generated/l10n.dart';
import 'package:hello_earth/pages/authentication/sign_in/sign_in_bloc.dart';
import 'package:hello_earth/pages/authentication/sign_in/widgets/sign_in_body.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/routing/authentication_routing.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/styles/app_dimensions.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    super.key,
  });

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends BlocPageState<SignInPage, SignInBloc> {
  late ThemeBloc themeBloc = BlocProvider.of<ThemeBloc>(context);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
        bloc: bloc,
        listener: _onStateChange,
        builder: (_, state) {
          return Scaffold(
            body: _buildBody(),
          );
        });
  }

  void _onStateChange(
    BuildContext context,
    SignInState state,
  ) {
    if (state is SignInSuccess) {
      //BlocProvider.of<SessionBloc>(context).add();
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
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          AdaptiveButton(
                            child: Container(
                              child: Text(S.of(context).logIn),
                              color: AppColors.primary,
                            ),
                            onPressed: () => {
                              bloc.add(
                                SignInViewChangeRequested(
                                  isFormEnabled: true,
                                ),
                              ),
                            },
                          ),
                          AdaptiveButton(
                            child: Container(
                              child: Text(S.of(context).registration),
                            ),
                            onPressed: () => {
                              bloc.add(
                                SignInViewChangeRequested(
                                  isFormEnabled: false,
                                ),
                              ),
                            },
                          ),
                        ],
                      ),
                      bloc.isFormEnabled ? _buildSignInBody() : _buildSignUpBody(),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: bloc.isFormEnabled ? _buildSignInButton() : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignInBody() {
    return Column(
      children: [
        SignInBody(
          emailTextFieldData: bloc.emailTextFieldData,
          passwordTextFieldData: bloc.passwordTextFieldData,
        ),
      ],
    );
  }

  Widget _buildSignInButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: AdaptiveButton(
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.primary, borderRadius: BorderRadius.circular(AppDimensions.defaultRadius)),
            child: Center(
              child: Text(
                S.of(context).signIn,
                style: TextStyle(
                  color: AppColors.buttonText,
                ),
              ),
            ),
            width: AppDimensions.width.button,
            height: AppDimensions.height.button,
          ),
          onPressed: () => bloc.add(
            SignInWithEmailRequested(),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpBody() {
    return Column(
      children: [
        AdaptiveButton(
          child: Container(
            child: Text(
              S.of(context).playerRegistration,
            ),
          ),
          onPressed: () => Navigator.of(context).pushNamed(
            AuthenticationRouting.signUpChild,
          ),
        ),
        AdaptiveButton(
          child: Container(
            child: Text(
              S.of(context).parentRegistration,
            ),
          ),
          onPressed: () => Navigator.of(context).pushNamed(
            AuthenticationRouting.signUpParent,
          ),
        ),
      ],
    );
  }
}
