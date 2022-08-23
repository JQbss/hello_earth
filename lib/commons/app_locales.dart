import 'package:flutter/material.dart';

class AppLocales {
  static const Locale poland = Locale.fromSubtags(
    languageCode: 'pl',
    countryCode: 'PL',
  );

  static Locale get current => poland;

  const AppLocales._();
}
