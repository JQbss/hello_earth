import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/theme/theme_bloc.dart';
import 'package:hello_earth/pages/questionnaire/questionnaire_bloc.dart';
import 'package:hello_earth/pages/questionnaire/questionnaire_page.dart';
import 'package:hello_earth/routing/routing.dart';

class QuestionnaireRouting {
  static const String _prefix = 'questionnaire';
  static const String questionnaire = '$_prefix/main';

  const QuestionnaireRouting._();

  static bool canHandleRoute(String? route) =>
      Routing.canHandleRoute(route, _prefix);

  static Route? getMainRoute(RouteSettings settings) {
    final String? routeName = settings.name;
    final Widget child;
    switch (routeName) {
      case questionnaire:
        child = BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, __) {
            return BlocProvider<QuestionnaireBloc>(
              create: (context) => QuestionnaireBloc(),
              child: QuestionnairePage(),
            );
          },
        );
        break;
      default:
        return null;
    }
    return Routing.buildRoute(
      child: child,
      settings: settings,
    );
  }
}