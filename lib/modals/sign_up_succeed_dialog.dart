import 'package:flutter/material.dart';
import 'package:hello_earth/generated/l10n.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';

class SignUpSucceedDialog {
  const SignUpSucceedDialog._();

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text(S.of(context).signUpSucceedDialogTitle),
        actionsOverflowDirection: VerticalDirection.down,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(
                context,
                title: S.of(context).signUpSucceedDialogButtonTitle,
                onPressed: () => Navigator.of(
                  context,
                  rootNavigator: true,
                ).pop(),
              ),
            ],
          )
        ],
      ),
    );
  }

  static Widget _buildButton(
    BuildContext context, {
    required String title,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      child: AdaptiveButton(
        child: Text(title),
        onPressed: onPressed,
      ),
    );
  }
}
