import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/theme/theme_bloc.dart';
import 'package:hello_earth/pages/authentication/sign_in/sign_in_bloc.dart';
import 'package:hello_earth/pages/authentication/sign_in/sign_in_page.dart';
import 'package:hello_earth/pages/authentication/sign_up/sign_up_child/sign_up_child_bloc.dart';
import 'package:hello_earth/pages/authentication/sign_up/sign_up_child/sign_up_child_page.dart';
import 'package:hello_earth/pages/authentication/sign_up/sign_up_parent/sign_up_parent_bloc.dart';
import 'package:hello_earth/pages/authentication/sign_up/sign_up_parent/sign_up_parent_page.dart';
import 'package:hello_earth/routing/routing.dart';

class AuthenticationRouting {
  static const String _prefix = 'authentication';
  static const String signIn = '$_prefix/signIn';
  static const String signUpChild = '$_prefix/signUpChild';
  static const String signUpParent = '$_prefix/signUpParent';

  const AuthenticationRouting._();

  static bool canHandleRoute(String? routeName) => Routing.canHandleRoute(routeName, _prefix);

  static Route? getMainRoute(RouteSettings settings) {
    final String? routeName = settings.name;
    final Widget child;
    switch (routeName) {
      case signIn:
        child = BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, __) {
            return BlocProvider<SignInBloc>(
              create: (_) => SignInBloc(
                isFormEnabled: true,
              ),
              child: SignInPage(),
            );
          },
        );
        break;
      case signUpChild:
        child = BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, __) {
            return BlocProvider<SignUpChildBloc>(
              create: (_) => SignUpChildBloc(),
              child: SignUpChildPage(),
            );
          },
        );
        break;
      case signUpParent:
        child = BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, __) {
            return BlocProvider<SignUpParentBloc>(
              create: (_) => SignUpParentBloc(),
              child: SignUpParentPage(),
            );
          },
        );
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
