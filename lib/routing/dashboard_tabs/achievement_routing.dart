import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/theme/theme_bloc.dart';
import 'package:hello_earth/pages/achievement/achievement_bloc.dart';
import 'package:hello_earth/pages/achievement/achievement_page.dart';
import 'package:hello_earth/routing/routing.dart';

class AchievementRouting {
  static const String _prefix = 'achievement';
  static const String achievements = '$_prefix/main';

  const AchievementRouting._();

  static bool canHandleRoute(String? route) =>
      Routing.canHandleRoute(route, _prefix);

  static Route? getMainRoute(RouteSettings settings) {
    final String? routeName = settings.name;
    final Widget child;
    switch (routeName) {
      case achievements:
        child = BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, __) {
            return BlocProvider<AchievementBloc>(
              create: (context) => AchievementBloc(),
              child: AchievementPage(),
            );
          },
        );
        break;
      default:
        return null;
    }
    return Routing.buildRoute(
      child: child,
      settings: settings,
    );
  }
}
