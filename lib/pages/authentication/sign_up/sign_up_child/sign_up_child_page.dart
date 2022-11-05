import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/session/session_bloc.dart';
import 'package:hello_earth/generated/l10n.dart';
import 'package:hello_earth/pages/authentication/sign_up/sign_up_child/sign_up_child_bloc.dart';
import 'package:hello_earth/pages/authentication/sign_up/widgets/sign_up_body.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/utils/navigation_utils.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';
import 'package:hello_earth/widgets/loading_button.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../styles/app_colors/app_colors.dart';
import '../../../../styles/app_dimensions.dart';

class SignUpChildPage extends StatefulWidget {
  const SignUpChildPage({
    super.key,
  });

  @override
  State<SignUpChildPage> createState() => _SignUpChildPageState();
}

class _SignUpChildPageState
    extends BlocPageState<SignUpChildPage, SignUpChildBloc> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final GlobalKey _signUpButtonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpChildBloc, SignUpChildState>(
      listener: _onStateChange,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.appBackground,
          body: _buildBody(),
        );
      },
    );
  }

  void _onStateChange(BuildContext context, SignUpChildState state) {
    BlocProvider.of<SessionBloc>(context).add(
      SessionStatusRequested(),
    );
    if (state is SignUpChildSuccess) {
      NavigationUtils.moveToDashboard(context);
    }
  }

  Widget _buildBody() {
    if (bloc.state is SignUpChildOnBoardClosed) {
      return _buildQrScanner();
    } else if (bloc.state is! QrCodeScanCompleted) {
      return _buildDashboardBody();
    }
    return SafeArea(
      child: SingleChildScrollView(
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
                  child: Column(
                    children: [
                      SignUpBody(
                        loginTextFieldData: bloc.loginTextFieldData,
                        emailTextFieldData: bloc.emailTextFieldData,
                        passwordTextFieldData: bloc.passwordTextFieldData,
                        profileTitle: 'Profil: gracz',
                        onChanged: (_) => bloc.add(
                          SignUpChildRequested(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildSignUpChildButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardBody() {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: Container(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Witamy na pokładzie',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '\tZaczynasz właśnie przygodę z Cooking planet!\n\n\tŻeby zarejestrować się musisz zeskanować kod QR u rodzica, jeżeli twój rodzic/opiekun jeszcze nie założył konto to sam czas to zrobić!\n\n\tPo zeskanowaniu kodu QR pojawi się formularz który należy wypełnić i powitamy Ci w naszym gronie',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: AppColors.textFieldBackground,
                  borderRadius:
                      BorderRadius.circular(AppDimensions.radius.input),
                ),
              ),
            ),
          ),
        ),
        _buildSignUpChildOnBoardButton(),
      ],
    );
  }

  Widget _buildSignUpChildOnBoardButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: AdaptiveButton(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppDimensions.radius.button),
          ),
          child: Center(
            child: Text(
              S.of(context).OpenQRScannerButton,
              style: TextStyle(
                color: AppColors.buttonText,
              ),
            ),
          ),
          width: AppDimensions.width.button,
          height: AppDimensions.height.button,
        ),
        onPressed: () => bloc.add(
          SignUpChildOnBoardCloseRequested(),
        ),
      ),
    );
  }

  Widget _buildQrScanner() {
    return QRView(
      key: qrKey,
      onQRViewCreated: bloc.onQRViewCreated,
    );
  }

  Widget _buildSignUpChildButton() {
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
              SignUpChildRequested(),
            ),
          ),
        ),
      ),
    );
  }
}
