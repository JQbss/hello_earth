import 'package:flutter/material.dart';
import 'package:hello_earth/injector/injector.dart';
import 'package:hello_earth/pages/navigators/global_navigator.dart';
import 'package:hello_earth/routing/routing.dart';

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
      navigatorKey: Injector().get<GlobalNavigator>().navigatorKey,
      initialRoute: widget.initialRoute,
      onGenerateRoute: Routing.getMainRoute,
    );
  }
}
