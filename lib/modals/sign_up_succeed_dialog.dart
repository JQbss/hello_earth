import 'package:flutter/material.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';

class SignUpSucceedDialog {
  Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text('Rejestracja zakończona sukcesem. Potwierdź swój adres e-mail, aby móc się zalogować'),
        actionsOverflowDirection: VerticalDirection.down,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(
                context,
                title: 'ok',
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

  Widget _buildButton(
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
