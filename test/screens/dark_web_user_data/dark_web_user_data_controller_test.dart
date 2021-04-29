import 'package:test/test.dart';
import 'package:vogel_app/screens/dark_web/dark_web_user_data/dark_web_user_data_controller.dart';

void main() {
  late DarkWebUserDataController controller;

  setUpAll(() {
    controller = DarkWebUserDataController();
  });

  group('DarkWebUserDataController', () {
    test('e-mail need be valid', () {
      controller.setEmail('email@email.com');
      expect(controller.emailIsValid, isTrue);
    });

    test('e-mail need be invalid', () {
      controller.setEmail('email.com');
      expect(controller.emailIsValid, isFalse);
    });

    test('username cannot be empty', () {
      controller.setUsername('username');
      expect(controller.username.isNotEmpty, isTrue);
    });

    test('fields cannot be empty', () {
      controller.setUsername('username');
      expect(controller.fieldsAreEmpty, isFalse);
    });

    test('fields need be empty', () {
      controller.setUsername('');
      controller.setEmail('');
      expect(controller.fieldsAreEmpty, isTrue);
    });
  });
}
