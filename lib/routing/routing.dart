import 'package:flutter/material.dart';

class Routing {
  static const String dashboard = 'dashboard';
  static const String onboarding = 'onboarding';

  const Routing._();

  static Route? getMainRoute(RouteSettings settings) {
    final String? routeName = settings.name;
    final Widget child;
    switch (routeName) {
      case dashboard:
        child = SizedBox.shrink();
        break;
      case onboarding:
        child = SizedBox.shrink();
        break;
      default:
        return null;
    }

    return buildRoute(
      settings: settings,
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
