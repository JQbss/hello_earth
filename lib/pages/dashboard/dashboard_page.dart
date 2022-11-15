import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/session/session_bloc.dart';
import 'package:hello_earth/blocs/user_data/user_data_bloc.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/pages/dashboard/commons/dashboard_tab.dart';
import 'package:hello_earth/pages/dashboard/dashboard_bloc.dart';
import 'package:hello_earth/routing/dashboard_tabs/achievements_routing.dart';
import 'package:hello_earth/routing/dashboard_tabs/parent/home_parent_routing.dart';
import 'package:hello_earth/routing/dashboard_tabs/player/home_player_routing.dart';
import 'package:hello_earth/routing/dashboard_tabs/settings_routing.dart';
import 'package:hello_earth/routing/dashboard_tabs/shopping_lists_routing.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/utils/navigation_utils.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    super.key,
  });

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends BlocPageState<DashboardPage, DashboardBloc> {
  static const List<DashboardTab> _tabs = [
    DashboardTab.home,
    DashboardTab.awardsOrQuestionnaire,
    DashboardTab.shoppingCart,
    DashboardTab.settings,
  ];

  final Map<DashboardTab, GlobalKey<NavigatorState>> _tabsNavigatorsKeys = {
    for (final DashboardTab tab in _tabs) tab: GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _checkSession();
    });
  }

  void _checkSession() {
    SessionBloc sessionBloc = BlocProvider.of<SessionBloc>(context);
    if (sessionBloc.state is SessionInactive) {
      NavigationUtils.moveToAuthentication(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        _sessionListener(),
        _userDataListener(),
      ],
      child: BlocConsumer<DashboardBloc, DashboardState>(
        bloc: bloc,
        builder: (_, state) {
          final SessionState sessionState =
              BlocProvider.of<SessionBloc>(context).state;
          if (sessionState is SessionInitial) {
            return Scaffold(
              body: CircularProgressIndicator(),
            );
          }
          return SafeArea(
            child: AnimatedSwitcher(
              duration: const Duration(
                milliseconds: 250,
              ),
              child: Scaffold(
                backgroundColor: AppColors.appBackground,
                body: _buildBody(state),
                bottomNavigationBar: _buildBottomNavigationBar(
                  activeTab: state.tab,
                ),
              ),
            ),
          );
        },
        listener: (_, state) {
          if (state is PopTabToRoot) {
            final NavigatorState? navigatorState =
                _tabsNavigatorsKeys[state.tab]?.currentState;
            if (navigatorState?.canPop() ?? false) {
              navigatorState?.popUntil(
                  (route) => route.settings.name == state.tab.initialRoute);
            }
          }
        },
      ),
    );
  }

  BlocListener<SessionBloc, SessionState> _sessionListener() {
    return BlocListener<SessionBloc, SessionState>(
      listener: (context, state) {
        if (state is SessionChildActive || state is SessionParentActive) {
          BlocProvider.of<UserDataBloc>(context).add(
            UserDataGetProfileRequested(),
          );
          bloc.add(
            ChangeSessionRequested(),
          );
        } else if (state is SessionInactive) {
          NavigationUtils.moveToAuthentication(context);
        }
      },
    );
  }

  BlocListener<UserDataBloc, UserDataState> _userDataListener() {
    return BlocListener<UserDataBloc, UserDataState>(
      listener: (context, state) {
        if (state is UserDataGetUserSuccess) {
          bloc.add(
            ChangeSessionRequested(),
          );
        }
      },
    );
  }

  Widget _buildBody(DashboardState state) {
    final SessionBloc sessionBloc = BlocProvider.of<SessionBloc>(context);
    final bool isProfileLoaded =
        BlocProvider.of<UserDataBloc>(context).state.profile != null;
    if (sessionBloc.isParent() && isProfileLoaded) {
      return _buildParentPages(state);
    } else if (sessionBloc.isChild() && isProfileLoaded) {
      return _buildPlayerPages(state);
    } else {
      return CircularProgressIndicator();
    }
  }

  Widget _buildParentPages(DashboardState state) {
    return Stack(
      children: [
        _buildPage(
          state,
          tab: DashboardTab.home,
          onGenerateRoute: HomeParentRouting.getMainRoute,
        ),
        _buildPage(
          state,
          tab: DashboardTab.awardsOrQuestionnaire,
          onGenerateRoute: SettingsRouting.getMainRoute,
        ),
        _buildPage(
          state,
          tab: DashboardTab.shoppingCart,
          onGenerateRoute: ShoppingListsRouting.getMainRoute,
        ),
        _buildPage(
          state,
          tab: DashboardTab.settings,
          onGenerateRoute: SettingsRouting.getMainRoute,
        ),
      ],
    );
  }

  Widget _buildPlayerPages(DashboardState state) {
    return Stack(
      children: [
        _buildPage(
          state,
          tab: DashboardTab.home,
          onGenerateRoute: HomePlayerRouting.getMainRoute,
        ),
        _buildPage(
          state,
          tab: DashboardTab.awardsOrQuestionnaire,
          onGenerateRoute: AchievementsRouting.getMainRoute,
        ),
        _buildPage(
          state,
          tab: DashboardTab.shoppingCart,
          onGenerateRoute: ShoppingListsRouting.getMainRoute,
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
        initialRoute: tab.initialRoute(context),
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
        type: BottomNavigationBarType.shifting,
        selectedItemColor: AppColors.primary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems({
    required DashboardTab activeTab,
  }) {
    return _tabs.map(
      (tab) {
        return BottomNavigationBarItem(
          label: tab.getLabel(context),
          icon: Icon(
            tab.getIcon(context),
            size: 30,
          ),
          backgroundColor: AppColors.appBackground,
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
