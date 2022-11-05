import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_earth/pages/authentication/sign_in/sign_in_bloc.dart';
import 'package:hello_earth/pages/authentication/sign_in/sign_in_page.dart';
import 'package:hello_earth/pages/authentication/sign_in/widgets/sign_in_body.dart';
import 'package:hello_earth/pages/authentication/sign_up/widgets/sign_up_body.dart';
import 'package:hello_earth/repositories/credential/network_credential_repository.dart';
import 'package:hello_earth/repositories/user/network_user_repository.dart';
import 'package:hello_earth/widgets/data_text_field.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../utils/firebase_authentication_mock_utils.dart';
import '../utils/material_app_builder_utils.dart';
import 'sign_in_page_test.mocks.dart';

class CredentialRepositoryTest extends Mock implements NetworkCredentialRepository {}

class UserRepositoryTest extends Mock implements NetworkUserRepository {}

@GenerateMocks([CredentialRepositoryTest])
@GenerateMocks([UserRepositoryTest])
main() async {
  late final CredentialRepositoryTest credentialRepositoryTest;
  late final UserRepositoryTest userRepositoryTest;
  setupFirebaseAuthenticationMocks();
  setUp(() async {
    await Firebase.initializeApp();
    credentialRepositoryTest = MockCredentialRepositoryTest();
    userRepositoryTest = MockUserRepositoryTest();
  });
  group('Test sign in page', () {
    testWidgets('Test displaying sign in page', (widgetTester) async {
      await widgetTester.pumpWidget(
        MaterialAppBuilderUtils.buildMaterialAppWithLocalization(
          child: BlocProvider(
            create: (_) => SignInBloc(
              credentialRepository: credentialRepositoryTest,
              userRepository: userRepositoryTest,
              isFormEnabled: true,
            ),
            child: SignInPage(),
          ),
        ),
      );
      await widgetTester.pumpAndSettle();
      final Finder SignInSwitchButtonFinder = find.text('Logowanie');
      final Finder SignUpSwitchButtonFinder = find.text('Rejestracja');
      expect(SignInSwitchButtonFinder, findsOneWidget);
      expect(SignUpSwitchButtonFinder, findsOneWidget);
      final Finder signInBodyFinder = find.byType(SignInBody);
      expect(signInBodyFinder, findsOneWidget);
      final Finder signInTextFieldsFinder = find.byType(DataTextField);
      expect(signInTextFieldsFinder, findsWidgets);
      final Finder signUpBodyFinder = find.byType(SignUpBody);
      expect(signUpBodyFinder, findsNothing);
    });
  });
}
