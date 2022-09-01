import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hello_earth/configuration.dart';
import 'package:hello_earth/environment.dart';
import 'package:hello_earth/pages/hello_earth_app.dart';

Future<void> mainCommon(Environment environment) async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Configuration.initialize(environment);

  runApp(
    HelloEarthApp(),
  );
}
