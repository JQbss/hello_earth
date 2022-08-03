import 'package:flutter/material.dart';
import 'package:hello_earth/pages/home/home_page.dart';
import 'package:hello_earth/routing/routing.dart';

class HomeRouting {
  static const String _prefix = 'home';
  static const String home = _prefix;

  const HomeRouting._();

  static Route? getMainRoute(RouteSettings settings) {
    return Routing.buildRoute(
      child: HomePage(),
      fullscreenDialog: false,
      settings: settings,
    );
  }
}
