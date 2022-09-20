import 'package:flutter/cupertino.dart';
import 'package:hello_earth/routing/authentication_routing.dart';
import 'package:hello_earth/routing/configuration_routing.dart';
import 'package:hello_earth/routing/routing.dart';

class NavigationUtils {
  const NavigationUtils._();

  static void moveToAuthentication(BuildContext context) {
    Navigator.of(
      context,
      rootNavigator: true,
    ).pushReplacementNamed(
      AuthenticationRouting.signIn,
    );
  }

  static void moveToConfigurationParent(BuildContext context) {
    Navigator.of(
      context,
      rootNavigator: true,
    ).pushReplacementNamed(
      ConfigurationRouting.parent,
    );
  }

  static void moveToConfigurationPlayer(BuildContext context) {
    Navigator.of(
      context,
      rootNavigator: true,
    ).pushReplacementNamed(
      ConfigurationRouting.player,
    );
  }

  static void moveToDashboard(BuildContext context) {
    Navigator.of(
      context,
      rootNavigator: true,
    ).pushReplacementNamed(
      Routing.dashboard,
    );
  }
}
