import 'package:local_auth/local_auth.dart';
import 'package:mobx/mobx.dart';

part 'dark_web_result_controller.g.dart';

class DarkWebResultController = _DarkWebResultControllerBase
    with _$DarkWebResultController;

abstract class _DarkWebResultControllerBase with Store {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  // To check if any type of biometric authentication
  // hardware is available.
  Future<bool> isBiometricAvailable() async {
    try {
      return await _localAuthentication.canCheckBiometrics;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Process of authentication user using fingerPrint or faceId.
  Future<bool> authenticateUser() async {
    try {
      return await _localAuthentication.authenticate(
        localizedReason: 'Please authenticate to store your data',
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } catch (e) {
      print(e);
      return false;
    }
  }
}
