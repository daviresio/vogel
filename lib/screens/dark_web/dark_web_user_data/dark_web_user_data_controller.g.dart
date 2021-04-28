// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dark_web_user_data_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DarkWebUserDataController on _DarkWebUserDataControllerBase, Store {
  Computed<bool>? _$emailIsValidComputed;

  @override
  bool get emailIsValid =>
      (_$emailIsValidComputed ??= Computed<bool>(() => super.emailIsValid,
              name: '_DarkWebUserDataControllerBase.emailIsValid'))
          .value;
  Computed<bool>? _$fieldsAreEmptyComputed;

  @override
  bool get fieldsAreEmpty =>
      (_$fieldsAreEmptyComputed ??= Computed<bool>(() => super.fieldsAreEmpty,
              name: '_DarkWebUserDataControllerBase.fieldsAreEmpty'))
          .value;

  final _$emailAtom = Atom(name: '_DarkWebUserDataControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$usernameAtom = Atom(name: '_DarkWebUserDataControllerBase.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$isLoadingAtom =
      Atom(name: '_DarkWebUserDataControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$searchleakedDataAsyncAction =
      AsyncAction('_DarkWebUserDataControllerBase.searchleakedData');

  @override
  Future<List<BreachedAccountModel>?> searchleakedData() {
    return _$searchleakedDataAsyncAction.run(() => super.searchleakedData());
  }

  final _$_DarkWebUserDataControllerBaseActionController =
      ActionController(name: '_DarkWebUserDataControllerBase');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_DarkWebUserDataControllerBaseActionController
        .startAction(name: '_DarkWebUserDataControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_DarkWebUserDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_DarkWebUserDataControllerBaseActionController
        .startAction(name: '_DarkWebUserDataControllerBase.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_DarkWebUserDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_DarkWebUserDataControllerBaseActionController
        .startAction(name: '_DarkWebUserDataControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_DarkWebUserDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
username: ${username},
isLoading: ${isLoading},
emailIsValid: ${emailIsValid},
fieldsAreEmpty: ${fieldsAreEmpty}
    ''';
  }
}
