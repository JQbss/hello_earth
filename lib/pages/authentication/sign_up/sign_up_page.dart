import 'package:flutter/material.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdaptiveButton(
          child: Container(
            child: Text('Dziecko'),
          ),
          onPressed: () => {},
        ),
        AdaptiveButton(
          child: Container(
            child: Text('Rodzic'),
          ),
          onPressed: () => {},
        ),
      ],
    );
  }
}
