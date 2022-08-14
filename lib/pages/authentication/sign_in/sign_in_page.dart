import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/pages/app/app_bloc.dart';
import 'package:hello_earth/pages/authentication/sign_in/sign_in_bloc.dart';
import 'package:hello_earth/pages/authentication/sign_in/widgets/sign_in_body.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/styles/app_colors/app_colors_dark.dart';
import 'package:hello_earth/styles/app_colors/app_colors_light.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    super.key,
  });

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends BlocPageState<SignInPage, SignInBloc> {
  late AppBloc appBloc = BlocProvider.of<AppBloc>(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
        bloc: bloc,
        listener: _onStateChange,
        builder: (_, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  _buildBody(),
                  _buildButton(),
                  _buildTest(context),
                ],
              ),
            ),
          );
        });
  }

  void _onStateChange(BuildContext context, SignInState state) {}

  Widget _buildBody() {
    return SignInBody(
      emailTextFieldData: bloc.emailTextFieldData,
      passwordTextFieldData: bloc.passwordTextFieldData,
    );
  }

  Widget _buildButton() {
    return AdaptiveButton(
      child: Container(
        child: Text(
          'zaloguj',
        ),
      ),
      onPressed: () => bloc.add(
        SignInWithEmailRequested(),
      ),
    );
  }

  Widget _buildTest(BuildContext context) {
    return Column(
      children: [
        Container(
          color: appBloc.colors.appBackground,
          height: 200,
          width: 200,
        ),
        AdaptiveButton(
          child: Text('ciemny'),
          onPressed: () => appBloc.add(
            ChangeThemeRequestedAppEvent(
              colors: AppColorsDark(),
              test: 'aaa',
            ),
          ),
        ),
        AdaptiveButton(
          child: Text('Jasnego'),
          onPressed: () => appBloc.add(
            ChangeThemeRequestedAppEvent(
              colors: AppColorsLight(),
              test: 'bbb',
            ),
          ),
        ),
      ],
    );
  }
}
