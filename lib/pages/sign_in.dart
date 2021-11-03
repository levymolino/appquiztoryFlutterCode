import 'package:appquiztory/pages/actualhome.dart';
import 'package:appquiztory/pages/devsignin.dart';
import 'package:appquiztory/pages/addquiz.dart';
import 'package:appquiztory/pages/sign_up.dart';
import 'package:appquiztory/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  int _counter = 0;

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
                      _btnController.start();
                      final user = await authService.signInWithEmailAndPassword(
                          emailcontroller.text, passwordcontroller.text);
                      if (user == null) {
                        return;
                      }
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ActualHome()));
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
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'DEVELOPED BY:',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.blue,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      ],
                    )),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _counter++;
                        });
                        if (_counter == 10) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      '3 more tap to enter developers mode')));
                        }
                        if (_counter == 13) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DevSignIn()));
                        }
                      },
                      child: Image.asset(
                        'assets/images/0402d5b772f14be394dcd6441b98132f.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                )
              ],
            )));
  }
}
