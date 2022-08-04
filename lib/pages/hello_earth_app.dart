import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/injector/injector.dart';
import 'package:hello_earth/pages/app/app_page.dart';
import 'package:hello_earth/pages/dashboard/dashboard_bloc.dart';
import 'package:hello_earth/pages/navigators/global_navigator.dart';
import 'package:hello_earth/routing/app_route_coordinator.dart';
import 'package:hello_earth/routing/routing.dart';

class HelloEarthApp extends StatefulWidget {
  const HelloEarthApp({Key? key}) : super(key: key);

  @override
  State<HelloEarthApp> createState() => _HelloEarthAppState();
}

class _HelloEarthAppState extends State<HelloEarthApp> {
  late final DashboardBloc _dashboardBloc;

  @override
  void initState() {
    super.initState();
    _initDashboardBloc();
  }

  @override
  void dispose() {
    _dashboardBloc.close();
    super.dispose();
  }

  void _initDashboardBloc() {
    _dashboardBloc = DashboardBloc();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: _dashboardBloc,
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
    return Routing.dashboard;
  }
}
