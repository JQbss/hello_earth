import 'package:flutter/material.dart';
import 'package:hello_earth/pages/parent/homeParent/home_parent_page.dart';
import 'package:hello_earth/routing/routing.dart';

class HomeParentRouting {
  static const String _prefix = 'homeParent';
  static const String home = _prefix;

  const HomeParentRouting._();

  static Route? getMainRoute(RouteSettings settings) {
    return Routing.buildRoute(
      child: HomeParentPage(),
      fullscreenDialog: false,
      settings: settings,
    );
  }
}