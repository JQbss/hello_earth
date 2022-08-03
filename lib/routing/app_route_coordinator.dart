import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
