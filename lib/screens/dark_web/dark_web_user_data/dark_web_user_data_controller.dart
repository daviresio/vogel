import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:vogel_app/models/breached_account/breached_account_model.dart';
import 'package:vogel_app/services/dark_web_service.dart';
import 'package:email_validator/email_validator.dart';

part 'dark_web_user_data_controller.g.dart';

class DarkWebUserDataController = _DarkWebUserDataControllerBase
    with _$DarkWebUserDataController;

abstract class _DarkWebUserDataControllerBase with Store {
  final TextEditingController emailCtl = TextEditingController();
  final TextEditingController usernameCtl = TextEditingController();

  final FocusNode nodeFocusEmail = FocusNode();
  final FocusNode nodeFocusUsername = FocusNode();

  void dispose() {
    emailCtl.dispose();
    usernameCtl.dispose();

    nodeFocusEmail.dispose();
    nodeFocusUsername.dispose();
  }

  @observable
  String email = '';

  @observable
  String username = '';

  @observable
  bool isLoading = false;

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setUsername(String value) {
    username = value;
  }

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @computed
  bool get emailIsValid => email.isNotEmpty && EmailValidator.validate(email);

  @computed
  bool get fieldsAreEmpty => email.isEmpty && username.isEmpty;

  @action
  Future<List<BreachedAccountModel>?> searchleakedData() async {
    isLoading = true;
    var errorOnFirstRequest = false;

    var accountsleaked = <BreachedAccountModel>[];
    if (email.isNotEmpty) {
      var emailResult = await searchUnprotectedData(value: email);

      if (emailResult == null) {
        errorOnFirstRequest = true;
      } else {
        accountsleaked = emailResult;
      }
    }
    if (username.isNotEmpty) {
      var usernameResult = await searchUnprotectedData(value: username);

      if (usernameResult == null && errorOnFirstRequest) {
        isLoading = false;
        return null;
      } else {
        accountsleaked = [...accountsleaked, ...usernameResult!];
      }
    }

    isLoading = false;
    return accountsleaked;
  }
}
