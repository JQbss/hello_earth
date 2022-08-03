import 'package:flutter/material.dart';
import 'package:hello_earth/pages/settings/settings_page.dart';
import 'package:hello_earth/routing/routing.dart';

class SettingsRouting {
  static const String _prefix = 'settings';
  static const String settings = _prefix;

  const SettingsRouting._();

  static Route? getMainRoute(RouteSettings settings) {
    return Routing.buildRoute(
      child: SettingsPage(),
      settings: settings,
    );
  }
}
