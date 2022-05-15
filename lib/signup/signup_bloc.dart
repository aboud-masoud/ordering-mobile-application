import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignupBloc {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  final storage = FlutterSecureStorage();

  bool validateFieldsEmpty() {
    if (fullNameController.text.isEmpty) {
      return false;
    }
    if (usernameController.text.isEmpty) {
      return false;
    }
    if (passwordController.text.isEmpty) {
      return false;
    }
    if (repasswordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  bool validatePassword() {
    if (passwordController.text == repasswordController.text) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> saveInSecureStorage() async {
    await storage.write(key: "username", value: usernameController.text);
    await storage.write(key: "password", value: passwordController.text);
    await storage.write(key: "name", value: fullNameController.text);
  }
}
