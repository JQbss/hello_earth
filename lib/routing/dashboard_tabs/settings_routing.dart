import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/session/session_bloc.dart';
import 'package:hello_earth/blocs/theme/theme_bloc.dart';
import 'package:hello_earth/pages/settings/settings_bloc.dart';
import 'package:hello_earth/pages/settings/settings_page.dart';
import 'package:hello_earth/routing/routing.dart';

class SettingsRouting {
  static const String _prefix = 'settings';
  static const String settings = _prefix;

  const SettingsRouting._();

  static Route? getMainRoute(RouteSettings settings) {
    return Routing.buildRoute(
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (_, __) {
          return BlocProvider<SettingsBloc>(
            create: (context) => SettingsBloc(
              sessionBloc: BlocProvider.of<SessionBloc>(context),
            ),
            child: SettingsPage(),
          );
        },
      ),
      settings: settings,
    );
  }
}
