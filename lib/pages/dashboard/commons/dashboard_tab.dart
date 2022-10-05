import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/session/session_bloc.dart';
import 'package:hello_earth/routing/dashboard_tabs/parent/home_parent_routing.dart';
import 'package:hello_earth/routing/dashboard_tabs/player/home_player_routing.dart';
import 'package:hello_earth/routing/dashboard_tabs/settings_routing.dart';

enum DashboardTab {
  home,
  awardsOrQuestionnaire,
  shoppingCart,
  settings;

  String initialRoute(BuildContext context) {
    final SessionBloc sessionBloc = BlocProvider.of<SessionBloc>(context);
    switch (this) {
      case DashboardTab.awardsOrQuestionnaire:
        return SettingsRouting.settings;
      case DashboardTab.home:
        return sessionBloc.isParent()
            ? HomeParentRouting.home
            : HomePlayerRouting.home;
      case DashboardTab.settings:
        return SettingsRouting.settings;
      case DashboardTab.shoppingCart:
        return SettingsRouting.settings;
    }
  }

  String getLabel(BuildContext context) {
    final SessionBloc sessionBloc = BlocProvider.of<SessionBloc>(context);
    switch (this) {
      case DashboardTab.awardsOrQuestionnaire:
        return sessionBloc.isParent() ? 'Kwestionariusz' : 'Awards';
      case DashboardTab.home:
        return 'Home';
      case DashboardTab.settings:
        return 'Settings';
      case DashboardTab.shoppingCart:
        return 'ShoppingCart';
    }
  }

  IconData getIcon(BuildContext context) {
    final SessionBloc sessionBloc = BlocProvider.of<SessionBloc>(context);
    switch (this) {
      case DashboardTab.awardsOrQuestionnaire:
        return sessionBloc.isParent()
            ? Icons.edit_note_rounded
            : Icons.emoji_events_rounded;
      case DashboardTab.home:
        return Icons.menu_book_rounded;
      case DashboardTab.settings:
        return Icons.settings_rounded;
      case DashboardTab.shoppingCart:
        return Icons.shopping_cart_rounded;
    }
  }
}
