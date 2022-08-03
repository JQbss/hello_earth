import 'package:flutter/material.dart';
import 'package:hello_earth/injector/injector.dart';
import 'package:hello_earth/pages/app/app_page.dart';
import 'package:hello_earth/pages/navigators/global_navigator.dart';
import 'package:hello_earth/routing/app_route_coordinator.dart';
import 'package:hello_earth/routing/routing.dart';

class HelloEarthApp extends StatefulWidget {
  const HelloEarthApp({Key? key}) : super(key: key);

  @override
  State<HelloEarthApp> createState() => _HelloEarthAppState();
}

class _HelloEarthAppState extends State<HelloEarthApp> {
  @override
  Widget build(BuildContext context) {
    return AppRouteCoordinator(
      globalNavigator: Injector().get<GlobalNavigator>(),
      child: AppPage(
        initialRoute: _getInitialRoute(),
      ),
    );
  }

  String _getInitialRoute() {
    return Routing.dashboard;
  }
}
