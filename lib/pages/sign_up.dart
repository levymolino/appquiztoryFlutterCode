import 'dart:async';

import 'package:appquiztory/pages/addprofile.dart';
import 'package:appquiztory/pages/sign_in.dart';
import 'package:appquiztory/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  void _doSomething() async {
    Timer(const Duration(seconds: 3), () {
      _btnController.success();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController confirmpasswordcontroller = TextEditingController();
    bool confirmpasswordVisibility;

    final authService = Provider.of<AuthService>(context);

    confirmpasswordVisibility = false;

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
                      'Sign up',
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
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: confirmpasswordcontroller,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
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
                  child: const Text('SIGN UP',
                      style: TextStyle(color: Colors.white)), //Sign up button
                  controller: _btnController,
                  onPressed: () async {
                    _btnController.start();
                    try {
                      if (passwordcontroller.text !=
                          confirmpasswordcontroller.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Passwords don't match!",
                            ),
                          ),
                        );
                        _btnController.reset();
                        
                        return;
                      }

                      final user =
                          await authService.createUserWithEmailAndPassword(
                        emailcontroller.text,
                        passwordcontroller.text,
                      );
                      if (user == null) {
                        return;
                      }
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddProfileDetail()));
                    } on FirebaseAuthException catch (e) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: ${e.message}')),
                      );
                      _btnController.reset();
                    }
                  },
                ),
                Row(
                  children: <Widget>[
                    const Text('Already have an account'),
                    TextButton(
                      child: const Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SignIn() //Going to signin page
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
