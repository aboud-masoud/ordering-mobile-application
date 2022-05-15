import 'package:flutter/material.dart';
import 'package:talabat_ordering_system/login/login_screen.dart';
import 'package:talabat_ordering_system/signup/signup_bloc.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  var bloc = SignupBloc();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 100),
            child: Column(
              children: [
                TextField(
                  controller: bloc.fullNameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(),
                      disabledBorder: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Full Name"),
                ),
                TextField(
                  controller: bloc.usernameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(),
                      disabledBorder: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "username"),
                ),
                TextField(
                  controller: bloc.passwordController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(),
                      disabledBorder: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "password"),
                ),
                TextField(
                  controller: bloc.repasswordController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(),
                      disabledBorder: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "re-password"),
                ),
                ElevatedButton(
                    onPressed: bloc.validateFieldsEmpty()
                        ? () async {
                            if (bloc.validatePassword()) {
                              // globalUsername = bloc.usernameController.text;
                              // globalPassword = bloc.passwordController.text;

                              await bloc.saveInSecureStorage();

                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (ctx) {
                                return LoginScreen();
                              }), (route) => false);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("passwords not equals"),
                              ));
                            }
                          }
                        : null,
                    child: const Text("submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
