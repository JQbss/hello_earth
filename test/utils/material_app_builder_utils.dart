import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hello_earth/commons/app_locales.dart';
import 'package:hello_earth/generated/l10n.dart';

class MaterialAppBuilderUtils {
  const MaterialAppBuilderUtils._();

  static Builder buildSimpleMaterialApp({
    required Widget child,
  }) {
    return Builder(builder: (_) {
      return MaterialApp(
        home: Scaffold(
          body: child,
        ),
      );
    });
  }

  static Builder buildMaterialAppWithLocalization({
    required Widget child,
  }) {
    return Builder(builder: (_) {
      return MaterialApp(
        localizationsDelegates: const [
          ...GlobalMaterialLocalizations.delegates,
          S.delegate,
        ],
        supportedLocales: const [
          AppLocales.poland,
        ],
        home: Scaffold(
          body: child,
        ),
      );
    });
  }
}
