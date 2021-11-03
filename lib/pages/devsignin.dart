import 'package:appquiztory/pages/devhome.dart';
import 'package:appquiztory/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class DevSignIn extends StatefulWidget {
  const DevSignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<DevSignIn> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();

    final authService = Provider.of<AuthService>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Developers Sign In'),
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
                    Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onLongPress: () {},
                      child: Image.asset(
                        'assets/images/0402d5b772f14be394dcd6441b98132f.png',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
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
                              builder: (context) => const DevHomePage()));
                    } on FirebaseAuthException catch (e) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: ${e.message}')),
                      );
                      _btnController.reset();
                    }
                  },
                ),
              ],
            )));
  }
}
