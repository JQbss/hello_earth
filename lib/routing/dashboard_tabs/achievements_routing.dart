import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/theme/theme_bloc.dart';
import 'package:hello_earth/pages/%20achievements/achievements_bloc.dart';
import 'package:hello_earth/pages/%20achievements/achievements_page.dart';
import 'package:hello_earth/routing/routing.dart';

class AchievementsRouting {
  static const String _prefix = 'achievements';
  static const String achievements = '$_prefix/main';

  const AchievementsRouting._();

  static bool canHandleRoute(String? route) =>
      Routing.canHandleRoute(route, _prefix);

  static Route? getMainRoute(RouteSettings settings) {
    final String? routeName = settings.name;
    final Widget child;
    switch (routeName) {
      case achievements:
        child = BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, __) {
            return BlocProvider<AchievementsBloc>(
              create: (context) => AchievementsBloc(),
              child: AchievementsPage(),
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
