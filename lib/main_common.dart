import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hello_earth/configuration.dart';
import 'package:hello_earth/environment.dart';
import 'package:hello_earth/injector/injector.dart';
import 'package:hello_earth/pages/hello_earth_app.dart';
import 'package:hello_earth/storages/session_storage.dart';

Future<void> mainCommon(Environment environment) async {
  await WidgetsFlutterBinding.ensureInitialized();
  final SessionStorage sessionStorage = Injector().get<SessionStorage>();
  final bool isChild = await sessionStorage.hasChildToken();
  final bool isParent = await sessionStorage.hasParentToken();
  await Configuration.initialize(environment);
  await Firebase.initializeApp();
  runApp(
    HelloEarthApp(
      isChild: isChild,
      isParent: isParent,
    ),
  );
}
