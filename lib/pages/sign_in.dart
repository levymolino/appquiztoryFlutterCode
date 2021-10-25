import 'dart:async';

import 'package:appquiztory/pages/addprofile.dart';
import 'package:appquiztory/pages/sign_up.dart';
import 'package:appquiztory/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  void _doSomething() {
    Timer(const Duration(seconds: 3), () {
      _btnController.success();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();

    final authService = Provider.of<AuthService>(context);
    
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quiztory'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Quiztory',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: emailcontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: passwordcontroller,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                TextButton(
                  child: const Text('Forgot Password?',
                      style: TextStyle(fontSize: 20, color: Colors.blue)),
                  onPressed: () {
                    //forgot password screen
                  },
                ),
                RoundedLoadingButton(
                  child: const Text('LOG IN',
                      style: TextStyle(color: Colors.white)),
                  controller: _btnController,
                  //onPressed: _doSomething,
                  onPressed: () async {
                    try {
                              final user = await authService.signInWithEmailAndPassword(
                    emailcontroller.text, passwordcontroller.text);
                              if (user == null) {
                                return;
                              }
                            } finally {
                              _btnController.success();
                            }
                            await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddProfileDetail()));
                  },
                ),
                Row(
                  children: <Widget>[
                    const Text('Does not have account?'),
                    TextButton(
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SignUp() //Going to signup page
                              ),
                        );
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )
              ],
            )));
  }
}
