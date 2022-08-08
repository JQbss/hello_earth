import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/session_bloc.dart';
import 'package:hello_earth/extensions/string_extension.dart';
import 'package:hello_earth/injector/injector.dart';
import 'package:hello_earth/pages/app/app_page.dart';
import 'package:hello_earth/pages/dashboard/dashboard_bloc.dart';
import 'package:hello_earth/pages/navigators/global_navigator.dart';
import 'package:hello_earth/routing/app_route_coordinator.dart';
import 'package:hello_earth/routing/authentication_routing.dart';
import 'package:hello_earth/routing/routing.dart';
import 'package:hello_earth/storages/session_storage.dart';

class HelloEarthApp extends StatefulWidget {
  final bool isChild;
  final bool isParent;

  const HelloEarthApp({
    required this.isChild,
    required this.isParent,
    super.key,
  });

  @override
  State<HelloEarthApp> createState() => _HelloEarthAppState();
}

class _HelloEarthAppState extends State<HelloEarthApp> {
  late final DashboardBloc _dashboardBloc;
  late final SessionBloc _sessionBloc;

  @override
  void initState() {
    super.initState();
    _initSessionBloc();
    _initDashboardBloc();
  }

  @override
  void dispose() {
    _dashboardBloc.close();
    _sessionBloc.close();
    super.dispose();
  }

  void _initDashboardBloc() {
    _dashboardBloc = DashboardBloc(
      sessionBloc: _sessionBloc,
    );
  }

  void _initSessionBloc() async {
    final SessionStorage sessionStorage = Injector().get<SessionStorage>();
    _sessionBloc = SessionBloc(
      sessionStorage: Injector().get<SessionStorage>(),
    );
    final bool isChild = await sessionStorage.hasChildToken();
    final bool isParent = await sessionStorage.hasParentToken();
    if (!isChild && !isParent) return;
    _sessionBloc.add(CreateSessionRequested(
      isChild: isChild,
      isParent: isParent,
      token: (isChild ? await sessionStorage.getChildToken() : await sessionStorage.getParentToken()).orEmpty(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: _dashboardBloc,
        ),
        BlocProvider.value(
          value: _sessionBloc,
        ),
      ],
      child: AppRouteCoordinator(
        globalNavigator: Injector().get<GlobalNavigator>(),
        child: AppPage(
          initialRoute: _getInitialRoute(),
        ),
      ),
    );
  }

  String _getInitialRoute() {
    if (widget.isChild || widget.isParent) {
      return Routing.dashboard;
    } else {
      return AuthenticationRouting.signIn;
    }
  }
}
