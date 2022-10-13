import 'package:ecommerce_app/src/features/authentication/ui/sign_in/email_password_sign_in_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';
import '../../auth_robot.dart';

void main() {
  const testEmail = 'test@test.com';
  const testPassword = '1234';
  late MockAuthRepository authRepository;

  setUp(() {
    authRepository = MockAuthRepository();
  });

  group('sign in', () {
    testWidgets('''
        Given formType is signIn
        When tap on the sign-in button
        Then signInWithEmailAndPassword is not called
        ''', (tester) async {
      final robot = AuthRobot(tester);
      await robot.pumpEmailPasswordSignInContents(
          authRepository: authRepository,
          formType: EmailPasswordSignInFormType.signIn);
      await robot.tapEmailAndPasswordSubmitButton();
      verifyNever(() => authRepository.signInWithEmailAndPassword(
            any(),
            any(),
          ));
    });
    testWidgets('''
        Given formType is signIn
        When enter valid email and password
        And tap on the sign-in button
        Then signInWithEmailAndPassword is called
        And onSignedIn callback is called
        And error alert is not shown
        ''', (tester) async {
      var didSignIn = false;
      final robot = AuthRobot(tester);
      when(() => authRepository.signInWithEmailAndPassword(
            testEmail,
            testPassword,
          )).thenAnswer((_) => Future.value());
      await robot.pumpEmailPasswordSignInContents(
          authRepository: authRepository,
          formType: EmailPasswordSignInFormType.signIn,
          onSignedIn: () => didSignIn = true);
      await robot.enterEmail(testEmail);
      await robot.enterPassword(testPassword);
      await robot.tapEmailAndPasswordSubmitButton();
      verify(() => authRepository.signInWithEmailAndPassword(
            testEmail,
            testPassword,
          )).called(1);
      robot.expectErrorAlertNotFound();
      expect(didSignIn, true);
    });
  });
}
