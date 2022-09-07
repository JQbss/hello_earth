import 'package:flutter/material.dart';

class HomePlayerPage extends StatefulWidget {
  const HomePlayerPage({
    super.key,
  });

  @override
  State<HomePlayerPage> createState() => _HomePlayerPageState();
}

class _HomePlayerPageState extends State<HomePlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Gracz',
      ),
    );
  }
}
