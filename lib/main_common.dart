import 'package:flutter/material.dart';
import 'package:hello_earth/environment.dart';
import 'package:hello_earth/injector/injector.dart';
import 'package:hello_earth/pages/hello_earth_app.dart';
import 'package:hello_earth/storages/session_storage.dart';

Future<void> mainCommon(Environment environment) async {
  await WidgetsFlutterBinding.ensureInitialized();
  final SessionStorage sessionStorage = Injector().get<SessionStorage>();
  final bool isChild = await sessionStorage.hasChildToken();
  final bool isParent = await sessionStorage.hasParentToken();

  runApp(
    HelloEarthApp(
      isChild: isChild,
      isParent: isParent,
    ),
  );
}
