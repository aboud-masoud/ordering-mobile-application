import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:talabat_ordering_system/home/home_screen.dart';
import 'package:talabat_ordering_system/login/login_bloc.dart';
import 'package:talabat_ordering_system/signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 100),
              child: Column(
                children: [
                  TextField(
                    controller: bloc.usernameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(),
                        disabledBorder: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "user name"),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: bloc.passwordController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(),
                        disabledBorder: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "password"),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                      onPressed: bloc.validateFieldsEmpty()
                          ? () async {
                              EasyLoading.show(status: 'loading...');

                              final values = await bloc.validateFieldsValues();

                              EasyLoading.dismiss();

                              if (values == VALIDATEFIELDS.userNameNotValid) {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text("wrong username"),
                                ));
                              } else if (values == VALIDATEFIELDS.passwordNotValid) {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text("wrong password"),
                                ));
                              } else {
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) {
                                  return HomeScreen();
                                }), (route) => false);
                              }
                            }
                          : null,
                      child: const Text("submit")),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                          return SignUpScreen();
                        }));
                      },
                      child: const Text("Signup")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
