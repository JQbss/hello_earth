import 'package:flutter/material.dart';
import 'package:hello_earth/routing/dashboard_tabs/home_routing.dart';
import 'package:hello_earth/routing/dashboard_tabs/settings_routing.dart';

enum DashboardTab {
  home,
  settings;

  String get initialRoute {
    switch (this) {
      case DashboardTab.home:
        return HomeRouting.home;
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
