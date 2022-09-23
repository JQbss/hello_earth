// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "contraindicationDishwasher": MessageLookupByLibrary.simpleMessage(
            "Czy istnieją przeciwskazania do używania zmywarki?"),
        "contraindicationMilk": MessageLookupByLibrary.simpleMessage(
            "Czy istnieją przeciwskazania do spożywaia mleka?"),
        "contraindicationOutside": MessageLookupByLibrary.simpleMessage(
            "Czy istnieją przeciwskazania do wychodzenia na zewnątrz np. do sklepu?"),
        "contraindicationSesame": MessageLookupByLibrary.simpleMessage(
            "Czy istnieją przeciwskazania do spożywania sezamu?"),
        "logIn": MessageLookupByLibrary.simpleMessage("Logowanie"),
        "parentRegistration":
            MessageLookupByLibrary.simpleMessage("Rejestracja rodzica"),
        "playerRegistration":
            MessageLookupByLibrary.simpleMessage("Rejestracja gracza"),
        "registration": MessageLookupByLibrary.simpleMessage("Rejestracja"),
        "signIn": MessageLookupByLibrary.simpleMessage("Zaloguj się"),
        "signUp": MessageLookupByLibrary.simpleMessage("Zarejestruj się"),
        "textFieldEmailHint":
            MessageLookupByLibrary.simpleMessage("Wpisz adres e-mail"),
        "textFieldEmailLabel": MessageLookupByLibrary.simpleMessage("E-mail"),
        "textFieldErrorBlank": MessageLookupByLibrary.simpleMessage(
            "Podane pole nie może być puste"),
        "textFieldLoginHint":
            MessageLookupByLibrary.simpleMessage("Wpisz login"),
        "textFieldLoginLabel": MessageLookupByLibrary.simpleMessage("Login"),
        "textFieldPasswordHint":
            MessageLookupByLibrary.simpleMessage("Podaj Hasło"),
        "textFieldPasswordLabel": MessageLookupByLibrary.simpleMessage("Hasło")
      };
}
