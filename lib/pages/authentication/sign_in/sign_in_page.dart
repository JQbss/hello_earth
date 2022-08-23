import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/theme/theme_bloc.dart';
import 'package:hello_earth/generated/l10n.dart';
import 'package:hello_earth/pages/authentication/sign_in/sign_in_bloc.dart';
import 'package:hello_earth/pages/authentication/sign_in/widgets/sign_in_body.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/routing/authentication_routing.dart';
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

  void _onStateChange(BuildContext context, SignInState state) {}

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              AdaptiveButton(
                child: Container(
                  child: Text(S.of(context).logIn),
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
    );
  }

  Widget _buildSignInBody() {
    return Column(
      children: [
        SignInBody(
          emailTextFieldData: bloc.emailTextFieldData,
          passwordTextFieldData: bloc.passwordTextFieldData,
        ),
        _buildSignInButton(),
      ],
    );
  }

  Widget _buildSignInButton() {
    return AdaptiveButton(
      child: Container(
        child: Text(S.of(context).signIn),
      ),
      onPressed: () => bloc.add(
        SignInWithEmailRequested(),
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
