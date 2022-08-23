import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hello_earth/commons/app_locales.dart';
import 'package:hello_earth/generated/l10n.dart';
import 'package:hello_earth/injector/injector.dart';
import 'package:hello_earth/pages/app/app_bloc.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/pages/navigators/global_navigator.dart';
import 'package:hello_earth/routing/routing.dart';

class AppPage extends StatefulWidget {
  final String initialRoute;

  const AppPage({
    super.key,
    required this.initialRoute,
  });

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends BlocPageState<AppPage, AppBloc> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Injector().get<GlobalNavigator>().navigatorKey,
      initialRoute: widget.initialRoute,
      onGenerateRoute: Routing.getMainRoute,
      localizationsDelegates: const [
        ...GlobalMaterialLocalizations.delegates,
        S.delegate,
      ],
      supportedLocales: const [
        AppLocales.poland,
      ],
    );
  }
}
