import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/session/session_bloc.dart';
import 'package:hello_earth/blocs/theme/theme_bloc.dart';
import 'package:hello_earth/generated/l10n.dart';
import 'package:hello_earth/pages/authentication/sign_in/sign_in_bloc.dart';
import 'package:hello_earth/pages/authentication/sign_in/widgets/sign_in_body.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/routing/authentication_routing.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/styles/app_dimensions.dart';
import 'package:hello_earth/utils/navigation_utils.dart';
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
            backgroundColor: AppColors.appBackground,
            body: _buildBody(),
          );
        });
  }

  void _onStateChange(
    BuildContext context,
    SignInState state,
  ) {
    if (state is SignInSuccess) {
      BlocProvider.of<SessionBloc>(context).add(
        SessionStatusRequested(),
      );
      NavigationUtils.moveToDashboard(context);
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
                      _buildToggleButton(),
                      const SizedBox(
                        height: 50,
                      ),
                      bloc.isFormEnabled
                          ? _buildSignInBody()
                          : _buildSignUpBody(),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child:
                  bloc.isFormEnabled ? _buildSignInButton() : SizedBox.shrink(),
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
                color: AppColors.primary,
                borderRadius:
                    BorderRadius.circular(AppDimensions.radius.button)),
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
            child: Center(
              child: Text(
                S.of(context).playerRegistration,
                style: TextStyle(color: AppColors.buttonText),
              ),
            ),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppDimensions.radius.button),
            ),
            height: AppDimensions.height.button,
            width: AppDimensions.width.button,
          ),
          onPressed: () => Navigator.of(context).pushNamed(
            AuthenticationRouting.signUpChild,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        AdaptiveButton(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(AppDimensions.radius.button),
            ),
            child: Center(
              child: Text(
                S.of(context).parentRegistration,
                style: TextStyle(color: AppColors.buttonText),
              ),
            ),
            height: AppDimensions.height.button,
            width: AppDimensions.width.button,
          ),
          onPressed: () => Navigator.of(context).pushNamed(
            AuthenticationRouting.signUpParent,
          ),
        ),
      ],
    );
  }

  Widget _buildToggleButton() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.disabled,
        borderRadius: BorderRadius.circular(AppDimensions.radius.toggleButton),
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color:
                    bloc.isFormEnabled ? AppColors.primary : AppColors.disabled,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppDimensions.radius.toggleButton),
                  bottomLeft:
                      Radius.circular(AppDimensions.radius.toggleButton),
                  topRight: Radius.circular(AppDimensions.radius.toggleButton),
                ),
              ),
              child: AdaptiveButton(
                child: Text(S.of(context).logIn,
                    style: TextStyle(
                        color: bloc.isFormEnabled
                            ? AppColors.buttonText
                            : AppColors.primary)),
                onPressed: () => {
                  bloc.add(
                    SignInViewChangeRequested(
                      isFormEnabled: true,
                    ),
                  ),
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color:
                    bloc.isFormEnabled ? AppColors.disabled : AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppDimensions.radius.toggleButton),
                  bottomRight:
                      Radius.circular(AppDimensions.radius.toggleButton),
                  topRight: Radius.circular(AppDimensions.radius.toggleButton),
                ),
              ),
              child: AdaptiveButton(
                child: Text(
                  S.of(context).registration,
                  style: TextStyle(
                      color: bloc.isFormEnabled
                          ? AppColors.primary
                          : AppColors.buttonText),
                ),
                onPressed: () => {
                  bloc.add(
                    SignInViewChangeRequested(
                      isFormEnabled: false,
                    ),
                  ),
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
