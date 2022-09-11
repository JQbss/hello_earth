import 'package:flutter/material.dart';
import 'package:hello_earth/pages/player/home_player/home_player_page.dart';
import 'package:hello_earth/routing/routing.dart';

class HomePlayerRouting {
  static const String _prefix = 'homePlayer';
  static const String home = _prefix;

  const HomePlayerRouting._();

  static Route? getMainRoute(RouteSettings settings) {
    return Routing.buildRoute(
      child: HomePlayerPage(),
      fullscreenDialog: false,
      settings: settings,
    );
  }
}
