// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Zarejestruj się`
  String get signUp {
    return Intl.message(
      'Zarejestruj się',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Zaloguj się`
  String get signIn {
    return Intl.message(
      'Zaloguj się',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Rejestracja`
  String get registration {
    return Intl.message(
      'Rejestracja',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Logowanie`
  String get logIn {
    return Intl.message(
      'Logowanie',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Rejestracja gracza`
  String get playerRegistration {
    return Intl.message(
      'Rejestracja gracza',
      name: 'playerRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Rejestracja rodzica`
  String get parentRegistration {
    return Intl.message(
      'Rejestracja rodzica',
      name: 'parentRegistration',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get textFieldEmailLabel {
    return Intl.message(
      'E-mail',
      name: 'textFieldEmailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Wpisz adres e-mail`
  String get textFieldEmailHint {
    return Intl.message(
      'Wpisz adres e-mail',
      name: 'textFieldEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Hasło`
  String get textFieldPasswordLabel {
    return Intl.message(
      'Hasło',
      name: 'textFieldPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Podaj Hasło`
  String get textFieldPasswordHint {
    return Intl.message(
      'Podaj Hasło',
      name: 'textFieldPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get textFieldLoginLabel {
    return Intl.message(
      'Login',
      name: 'textFieldLoginLabel',
      desc: '',
      args: [],
    );
  }

  /// `Wpisz login`
  String get textFieldLoginHint {
    return Intl.message(
      'Wpisz login',
      name: 'textFieldLoginHint',
      desc: '',
      args: [],
    );
  }

  /// `Czy istnieją przeciwskazania do używania zmywarki?`
  String get contraindicationDishwasher {
    return Intl.message(
      'Czy istnieją przeciwskazania do używania zmywarki?',
      name: 'contraindicationDishwasher',
      desc: '',
      args: [],
    );
  }

  /// `Czy istnieją przeciwskazania do spożywaia mleka?`
  String get contraindicationMilk {
    return Intl.message(
      'Czy istnieją przeciwskazania do spożywaia mleka?',
      name: 'contraindicationMilk',
      desc: '',
      args: [],
    );
  }

  /// `Czy istnieją przeciwskazania do wychodzenia na zewnątrz np. do sklepu?`
  String get contraindicationOutside {
    return Intl.message(
      'Czy istnieją przeciwskazania do wychodzenia na zewnątrz np. do sklepu?',
      name: 'contraindicationOutside',
      desc: '',
      args: [],
    );
  }

  /// `Czy istnieją przeciwskazania do spożywania sezamu?`
  String get contraindicationSesame {
    return Intl.message(
      'Czy istnieją przeciwskazania do spożywania sezamu?',
      name: 'contraindicationSesame',
      desc: '',
      args: [],
    );
  }

  /// `Podane pole nie może być puste`
  String get textFieldErrorBlank {
    return Intl.message(
      'Podane pole nie może być puste',
      name: 'textFieldErrorBlank',
      desc: '',
      args: [],
    );
  }

  /// `Otwórz skaner`
  String get OpenQRScannerButton {
    return Intl.message(
      'Otwórz skaner',
      name: 'OpenQRScannerButton',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pl'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
