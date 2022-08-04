import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/pages/dashboard/commons/dashboard_tab.dart';
import 'package:hello_earth/pages/dashboard/dashboard_bloc.dart';
import 'package:hello_earth/routing/dashboard_tabs/home_routing.dart';
import 'package:hello_earth/routing/dashboard_tabs/settings_routing.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    super.key,
  });

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends BlocPageState<DashboardPage, DashboardBloc> with WidgetsBindingObserver {
  static const List<DashboardTab> _tabs = [
    DashboardTab.home,
    DashboardTab.settings,
  ];

  final Map<DashboardTab, GlobalKey<NavigatorState>> _tabsNavigatorsKeys = {
    for (final DashboardTab tab in _tabs) tab: GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      bloc: bloc,
      builder: (_, state) {
        return Scaffold(
          body: _buildBody(state),
          bottomNavigationBar: _buildBottomNavigationBar(
            activeTab: DashboardTab.home,
          ),
        );
      },
      listener: (_, state) {
        if (state is PopTabToRoot) {
          final NavigatorState? navigatorState = _tabsNavigatorsKeys[state.tab]?.currentState;
          if (navigatorState?.canPop() ?? false) {
            navigatorState?.popUntil((route) => route.settings.name == state.tab.initialRoute);
          }
        }
      },
    );
  }

  Widget _buildBody(DashboardState state) {
    Widget child;
    child = _buildPages(state);
    return child;
  }

  Widget _buildPages(DashboardState state) {
    return Stack(
      children: [
        _buildPage(
          state,
          tab: DashboardTab.home,
          onGenerateRoute: HomeRouting.getMainRoute,
        ),
        _buildPage(
          state,
          tab: DashboardTab.settings,
          onGenerateRoute: SettingsRouting.getMainRoute,
        ),
      ],
    );
  }

  Widget _buildPage(
    DashboardState state, {
    required DashboardTab tab,
    required RouteFactory onGenerateRoute,
  }) {
    return Offstage(
      offstage: tab != state.tab,
      child: Navigator(
        key: _tabsNavigatorsKeys[tab],
        initialRoute: tab.initialRoute,
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
        onTap: (index) => _changeTab(_tabs[index]),
        currentIndex: _tabs.indexOf(activeTab),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems({
    required DashboardTab activeTab,
  }) {
    return _tabs.map(
      (tab) {
        final bool isTabActive = activeTab == tab;
        return BottomNavigationBarItem(
          label: tab.getLabel(context),
          icon: Icon(Icons.coffee_sharp),
        );
      },
    ).toList();
  }

  Future<void> _changeTab(DashboardTab tab) async {
    bloc.add(
      ChangeTabRequested(
        tab: tab,
      ),
    );
  }
}
