import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_earth/commons/text_field_data.dart';
import 'package:hello_earth/errors/error_keys.dart';
import 'package:hello_earth/utils/text_field_validators_util.dart';
import 'package:hello_earth/widgets/data_text_field.dart';

import '../utils/firebase_authentication_mock_utils.dart';
import '../utils/material_app_builder_utils.dart';

main() async {
  setupFirebaseAuthenticationMocks();
  setUpAll(() async {
    await Firebase.initializeApp();
  });
  group('Test data text field', () {
    testWidgets('Test data text field', (widgetTester) async {
      final String hintText = 'Test hint text';
      final String labelText = 'Test label text';
      final String testEmail = 'test@wp.pl';
      final TextFieldData emailTextFieldData = TextFieldData(
        (text) => TextFieldValidatorsUtil.validateEmail(text.trim()),
        errorKey: ErrorKeys.email,
      );
      final DataTextField dataTextField = DataTextField(
        emailTextFieldData,
        hintText: hintText,
        labelText: labelText,
      );
      await widgetTester.pumpWidget(
        MaterialAppBuilderUtils.buildSimpleMaterialApp(
          child: dataTextField,
        ),
      );
      final Finder hintFinder = find.text(hintText);
      final Finder labelFinder = find.text(labelText);
      expect(hintFinder, findsOneWidget);
      expect(labelFinder, findsOneWidget);
      await widgetTester.enterText(find.byType(DataTextField), testEmail).then(
            (value) => emailTextFieldData.controller.text = testEmail,
          );
      final Finder enteredTextFinder = find.text(testEmail);
      expect(enteredTextFinder, findsOneWidget);
    });
  });
}
