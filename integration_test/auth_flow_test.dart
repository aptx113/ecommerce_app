import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../test/src/robot.dart';

void main() {
  const testEmail = 'test123@gmail.com';
  const testPassword = 'test123';
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Sign in and sign out flow', (tester) async {
    final robot = Robot(tester);
    await robot.pumpMyApp();
    robot.expectFindAllProductCard();
    await robot.openPopupMenu();
    await robot.auth.openEmailPasswordSignInScreen();
    await robot.auth.signInWithEmailAndPassword(testEmail, testPassword);
    robot.expectFindAllProductCard();

    await robot.openPopupMenu();
    await robot.auth.openAccountScreen();
    await robot.auth.tapLogoutButton();
    await robot.auth.tapDialogLogoutButton();
    robot.expectFindAllProductCard();
  });
}
