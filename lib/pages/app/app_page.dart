import 'package:flutter/material.dart';

class AppPage extends StatefulWidget {
  final String initialRoute;

  const AppPage({
    super.key,
    required this.initialRoute,
  });

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: widget.initialRoute,
    );
  }
}
