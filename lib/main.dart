import 'package:appquiztory/pages/sign_in.dart';
import 'package:appquiztory/pages/sign_up.dart';
import 'package:appquiztory/services/auth_service.dart';
import 'package:appquiztory/services/wrapper.dart';
import 'package:appquiztory/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [Provider<AuthService>(create: (_) => AuthService())],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const Wrapper(),
          '/Login': (context) => const SignIn(),
          '/register': (context) => const SignUp(),
        },
      ),);
  }
}
