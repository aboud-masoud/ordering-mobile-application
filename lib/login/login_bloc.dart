import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum VALIDATEFIELDS { userNameNotValid, passwordNotValid, valid }

class LoginBloc {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final storage = FlutterSecureStorage();

  bool validateFieldsEmpty() {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }

    return true;
  }

  Future<VALIDATEFIELDS> validateFieldsValues() async {
    final usernameInSecureStorage = await storage.read(key: "username");
    final passwordInSecureStorage = await storage.read(key: "password");

    if (usernameController.text != usernameInSecureStorage) {
      return VALIDATEFIELDS.userNameNotValid;
    } else if (passwordController.text != passwordInSecureStorage) {
      return VALIDATEFIELDS.passwordNotValid;
    } else {
      return VALIDATEFIELDS.valid;
    }
  }
}
