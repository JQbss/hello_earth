import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/pages/authentication/sign_in_bloc.dart';
import 'package:hello_earth/pages/authentication/sign_in_page.dart';
import 'package:hello_earth/routing/routing.dart';

class AuthenticationRouting {
  static const String _prefix = 'authentication';
  static const String signIn = '$_prefix/signIn';

  const AuthenticationRouting._();

  static bool canHandleRoute(String? routeName) => Routing.canHandleRoute(routeName, _prefix);

  static Route? getMainRoute(RouteSettings settings) {
    final String? routeName = settings.name;
    final Widget child;

    switch (routeName) {
      case signIn:
        child = const SignInPage();
        break;
      default:
        return null;
    }
    return Routing.buildRoute(
      child: child,
      fullscreenDialog: false,
      settings: settings,
    );
  }
}
