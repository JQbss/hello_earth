import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/generated/l10n.dart';
import 'package:hello_earth/pages/authentication/sign_in/sign_in_bloc.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';

class SignInEmailErrorDialog {
  const SignInEmailErrorDialog._();

  static Future<void> show(
    BuildContext context, {
    required VoidCallback onSendPressed,
  }) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text(S.of(context).signInEmailErrorDialogTitle),
        actionsOverflowDirection: VerticalDirection.down,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(
                context,
                title: S.of(context).signInEmailErrorCancel,
                onPressed: () => Navigator.of(
                  context,
                  rootNavigator: true,
                ).pop(),
              ),
              _buildButton(
                context,
                title: S.of(context).signInEmailErrorSend,
                onPressed: onSendPressed,
                isActive: !(BlocProvider.of<SignInBloc>(context).state is SignInEmailSent),
              ),
            ],
          )
        ],
      ),
    );
  }

  static Future<void> showEmailSent(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text(
          S.of(context).signInEmailSentTitle,
        ),
        actions: [
          _buildButton(
            context,
            title: S.of(context).signInEmailDialogClose,
            onPressed: () => Navigator.of(
              context,
              rootNavigator: true,
            ).pop(),
          ),
        ],
      ),
    );
  }

  static Widget _buildButton(
    BuildContext context, {
    bool isActive = true,
    required String title,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      child: AdaptiveButton(
        child: Text(title),
        isActive: isActive,
        onPressed: onPressed,
      ),
    );
  }
}
