import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/session/session_bloc.dart';
import 'package:hello_earth/routing/dashboard_tabs/parent/home_parent_routing.dart';
import 'package:hello_earth/routing/dashboard_tabs/player/home_player_routing.dart';
import 'package:hello_earth/routing/dashboard_tabs/settings_routing.dart';

enum DashboardTab {
  home,
  settings;

  String initialRoute(BuildContext context) {
    final SessionBloc sessionBloc = BlocProvider.of<SessionBloc>(context);
    switch (this) {
      case DashboardTab.home:
        return sessionBloc.isParent() ? HomeParentRouting.home : HomePlayerRouting.home;
      case DashboardTab.settings:
        return SettingsRouting.settings;
    }
  }

  String getLabel(BuildContext context) {
    switch (this) {
      case DashboardTab.home:
        return 'Home';
      case DashboardTab.settings:
        return 'Settings';
    }
  }
}
