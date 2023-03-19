import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/welcome/WelcomeScreen.dart';
import 'package:food_ordering_app/welcome/loginPage.dart';
import 'package:food_ordering_app/welcome/signupPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'home',
      routes: {
        'home': (context) => WelcomeScreen(),
        'login': (context) => LoginPage(),
        'signUp': (context) => SingUpPagge()
      },
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
