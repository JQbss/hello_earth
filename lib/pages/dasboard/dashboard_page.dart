import 'package:flutter/material.dart';
import 'package:hello_earth/pages/dasboard/commons/dashboard_tab.dart';
import 'package:hello_earth/routing/dashboard_tabs/home_routing.dart';
import 'package:hello_earth/routing/dashboard_tabs/settings_routing.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    super.key,
  });

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  static const List<DashboardTab> _tabs = [
    DashboardTab.home,
    DashboardTab.settings,
  ];

  final Map<DashboardTab, GlobalKey<NavigatorState>> _tabsNavigatorsKeys = {
    for (final DashboardTab tab in _tabs) tab: GlobalKey(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(
        activeTab: DashboardTab.home,
      ),
    );
  }

  Widget _buildBody() {
    Widget child;
    child = _buildPages();
    return child;
  }

  Widget _buildPages() {
    return Stack(
      children: [
        _buildPage(
          tab: DashboardTab.home,
          onGenerateRoute: HomeRouting.getMainRoute,
        ),
        _buildPage(
          tab: DashboardTab.settings,
          onGenerateRoute: SettingsRouting.getMainRoute,
        ),
      ],
    );
  }

  Widget _buildPage({
    required DashboardTab tab,
    required RouteFactory onGenerateRoute,
  }) {
    return Offstage(
      child: Navigator(
        key: _tabsNavigatorsKeys[tab],
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }

  Widget _buildBottomNavigationBar({
    required DashboardTab activeTab,
  }) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 80.0,
      ),
      child: BottomNavigationBar(
        items: _buildBottomNavigationBarItems(
          activeTab: activeTab,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems({
    required DashboardTab activeTab,
  }) {
    return _tabs.map((tab) {
      final bool isTabActive = activeTab == tab;
      return BottomNavigationBarItem(
        label: tab.getLabel(context),
        icon: Icon(Icons.coffee_sharp),
      );
    }).toList();
  }
}
