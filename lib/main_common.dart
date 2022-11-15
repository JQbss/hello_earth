import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hello_earth/configuration.dart';
import 'package:hello_earth/environment.dart';
import 'package:hello_earth/firebase_options_dev.dart' as dev;
import 'package:hello_earth/firebase_options_prod.dart' as prod;
import 'package:hello_earth/pages/hello_earth_app.dart';

Future<void> mainCommon(Environment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Configuration.initialize(environment);
  await Firebase.initializeApp(
    options: Configuration.currentEnvironment == Environment.dev
        ? dev.DefaultFirebaseOptions.currentPlatform
        : prod.DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    HelloEarthApp(),
  );
}
