import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/theme/theme_bloc.dart';
import 'package:hello_earth/pages/parent/configuration_parent/configuration_parent_page.dart';
import 'package:hello_earth/pages/player/configuration_player/configuration_player_page.dart';
import 'package:hello_earth/routing/routing.dart';

class ConfigurationRouting {
  static const String _prefix = 'configuration';
  static const String parent = '$_prefix/parent';
  static const String player = '$_prefix/player';

  const ConfigurationRouting._();

  static bool canHandleRoute(String? routeName) => Routing.canHandleRoute(routeName, _prefix);

  static Route? getMainRoute(RouteSettings settings) {
    final String? routeName = settings.name;
    final Widget child;
    switch (routeName) {
      case parent:
        child = BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, __) {
            return ConfigurationParentPage();
          },
        );
        break;
      case player:
        child = BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, __) {
            return ConfigurationPlayerPage();
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
