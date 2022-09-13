import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/configuration/configuration_bloc.dart';
import 'package:hello_earth/blocs/session/session_bloc.dart';
import 'package:hello_earth/blocs/theme/theme_bloc.dart';
import 'package:hello_earth/blocs/user_data/user_data_bloc.dart';
import 'package:hello_earth/injector/injector.dart';
import 'package:hello_earth/pages/app/app_bloc.dart';
import 'package:hello_earth/pages/app/app_page.dart';
import 'package:hello_earth/pages/dashboard/dashboard_bloc.dart';
import 'package:hello_earth/pages/navigators/global_navigator.dart';
import 'package:hello_earth/repositories/credential/network_credential_repository.dart';
import 'package:hello_earth/repositories/family/natwork_family_repository.dart';
import 'package:hello_earth/repositories/user/network_user_repository.dart';
import 'package:hello_earth/routing/app_route_coordinator.dart';
import 'package:hello_earth/routing/routing.dart';
import 'package:hello_earth/styles/app_colors/app_colors_dark.dart';

class HelloEarthApp extends StatefulWidget {
  const HelloEarthApp({
    super.key,
  });

  @override
  State<HelloEarthApp> createState() => _HelloEarthAppState();
}

class _HelloEarthAppState extends State<HelloEarthApp> {
  late final AppBloc _appBloc;
  late final ConfigurationBloc _configurationBloc;
  late final DashboardBloc _dashboardBloc;
  late final SessionBloc _sessionBloc;
  late final ThemeBloc _themeBloc;
  late final UserDataBloc _userDataBloc;

  @override
  void initState() {
    super.initState();
    _initAppBloc();
    _initConfigurationBloc();
    _initThemeBloc();
    _initSessionBloc();
    _initDashboardBloc();
    _initUserDataBloc();
  }

  @override
  void dispose() {
    _appBloc.close();
    _configurationBloc.close();
    _dashboardBloc.close();
    _sessionBloc.close();
    _themeBloc.close();
    _userDataBloc.close();
    super.dispose();
  }

  void _initAppBloc() {
    _appBloc = AppBloc();
  }

  void _initConfigurationBloc() {
    _configurationBloc = ConfigurationBloc(
      familyRepository: Injector().get<NetworkFamilyRepository>(),
    );
  }

  void _initDashboardBloc() {
    _dashboardBloc = DashboardBloc(
      sessionBloc: _sessionBloc,
    );
  }

  void _initSessionBloc() {
    _sessionBloc = SessionBloc(
      configurationBloc: _configurationBloc,
      credentialRepository: Injector().get<NetworkCredentialRepository>(),
      userRepository: Injector().get<NetworkUserRepository>(),
    );
    _sessionBloc.add(
      SessionStatusRequested(),
    );
  }

  void _initThemeBloc() {
    _themeBloc = ThemeBloc(
      colors: AppColorsDark(),
      themeName: 'dark',
    );
  }

  void _initUserDataBloc() {
    _userDataBloc = UserDataBloc(
      credentialRepository: Injector().get<NetworkCredentialRepository>(),
      userRepository: Injector().get<NetworkUserRepository>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => _appBloc,
        ),
        BlocProvider(
          create: (_) => _configurationBloc,
        ),
        BlocProvider(
          create: (_) => _sessionBloc,
        ),
        BlocProvider(
          create: (_) => _dashboardBloc,
        ),
        BlocProvider(
          create: (_) => _themeBloc,
        ),
        BlocProvider(
          create: (_) => _userDataBloc,
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
