import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/theme/theme_bloc.dart';
import 'package:hello_earth/injector/injector.dart';
import 'package:hello_earth/pages/player/home_player/home_player_bloc.dart';
import 'package:hello_earth/pages/player/home_player/home_player_page.dart';
import 'package:hello_earth/repositories/main_missions/network_main_missions_repository.dart';
import 'package:hello_earth/routing/routing.dart';

class HomePlayerRouting {
  static const String _prefix = 'homePlayer';
  static const String home = _prefix;

  const HomePlayerRouting._();

  static Route? getMainRoute(RouteSettings settings) {
    final String? routeName = settings.name;
    final Widget child;
    switch (routeName) {
      case home:
        child = BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, __) {
            return BlocProvider<HomePlayerBloc>(
              create: (_) => HomePlayerBloc(
                mainMissionsRepository: Injector().get<NetworkMainMissionsRepository>(),
              ),
              child: HomePlayerPage(),
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
