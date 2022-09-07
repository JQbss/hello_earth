import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/session/session_bloc.dart';
import 'package:hello_earth/pages/navigators/global_navigator.dart';

class AppRouteCoordinator extends StatefulWidget {
  final GlobalNavigator globalNavigator;
  final Widget child;

  const AppRouteCoordinator({
    super.key,
    required this.globalNavigator,
    required this.child,
  });

  @override
  State<AppRouteCoordinator> createState() => _AppRouteCoordinatorState();
}

class _AppRouteCoordinatorState extends State<AppRouteCoordinator> {
  final Completer<void> _sessionCompleter = Completer();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        _sessionBlocListener(),
      ],
      child: widget.child,
    );
  }

  BlocListener _sessionBlocListener() {
    return BlocListener<SessionBloc, SessionState>(
      listenWhen: (_, state) => state is SessionInactive || state is SessionChildActive || state is SessionParentActive,
      listener: (_, state) {
        if (_sessionCompleter.isCompleted) {
          _sessionCompleter.complete();
        }
      },
    );
  }
}
