import 'package:ecommerce_app/src/features/authentication/models/app_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';
import '../../auth_robot.dart';

void main() {
  testWidgets('Cancel logout', (tester) async {
    final robot = AuthRobot(tester);
    await robot.pumpAccountScreen();
    await robot.tapLogoutButton();
    robot.expectLogoutDialogFound();
    await robot.tapCancelButton();
    robot.expectLogoutDialogNotFound();
  });

  testWidgets('Confirm logout success', (tester) async {
    final robot = AuthRobot(tester);
    await robot.pumpAccountScreen();
    await robot.tapLogoutButton();
    robot.expectLogoutDialogFound();
    await robot.tapDialogLogoutButton();
    robot.expectLogoutDialogNotFound();
    robot.expectErrorAlertNotFound();
  });

  testWidgets('Confirm logout, failure', (tester) async {
    final robot = AuthRobot(tester);
    final authRepository = MockAuthRepository();
    final exception = Exception('Connection Failed');
    when(authRepository.signOut).thenThrow(exception);
    when(authRepository.authStateChanges).thenAnswer(
      (_) => Stream.value(
        const AppUser(uid: '123', email: 'test@test.com'),
      ),
    );
    await robot.pumpAccountScreen(authRepository: authRepository);
    await robot.tapLogoutButton();
    robot.expectLogoutDialogFound();
    await robot.tapDialogLogoutButton();
    robot.expectErrorAlertFound();
  });

  testWidgets('Confirm logout, loading state', (tester) async {
    final robot = AuthRobot(tester);
    final authRepository = MockAuthRepository();
    when(authRepository.signOut).thenAnswer(
      (_) => Future.delayed(const Duration(seconds: 1)),
    );
    when(authRepository.authStateChanges).thenAnswer(
      (_) => Stream.value(
        const AppUser(uid: '123', email: 'test@test.com'),
      ),
    );
    await robot.pumpAccountScreen(authRepository: authRepository);
    await tester.runAsync(() async {
      await robot.tapLogoutButton();
      robot.expectLogoutDialogFound();
      await robot.tapDialogLogoutButton();
    });
    robot.expectCircularProgressIndicator();
  });
}
