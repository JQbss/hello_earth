import 'package:flutter/material.dart';

class GlobalNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext? get currentContext => navigatorKey.currentState?.overlay?.context;

  NavigatorState? get _currentState => navigatorKey.currentState;

  Future<dynamic>? pushNamed<T extends Object>(
    String routeName, {
    T? arguments,
  }) {
    return _currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic>? pushNamedAndRemoveUntil<T extends Object>(
    String routeName,
    RoutePredicate predicate, {
    T? arguments,
  }) {
    return _currentState?.pushNamedAndRemoveUntil(
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  Future<dynamic>? pushNamedAndRemoveUntilLast<T extends Object>(
    String routeName, {
    T? arguments,
  }) {
    return pushNamedAndRemoveUntil(
      routeName,
      (_) => false,
      arguments: arguments,
    );
  }

  void pop() {
    _currentState?.pop();
  }

  void popUntil(RoutePredicate predicate) {
    _currentState?.popUntil(predicate);
  }
}
