import 'package:flutter/material.dart';
import 'package:hello_earth/pages/dashboard/dashboard_page.dart';

class Routing {
  static const String dashboard = 'dashboard';

  const Routing._();

  static Route? getMainRoute(RouteSettings settings) {
    final String? routeName = settings.name;
    final Widget child;
    switch (routeName) {
      case dashboard:
        child = DashboardPage();
        break;
      default:
        return null;
    }

    return buildRoute(
      settings: settings,
      fullscreenDialog: false,
      child: child,
    );
  }

  static Route buildRoute({
    required Widget child,
    bool fullscreenDialog = false,
    required RouteSettings settings,
  }) =>
      MaterialPageRoute(
        builder: (_) => child,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
      );
}
