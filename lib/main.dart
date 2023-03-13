import 'package:flutter/material.dart';
import 'package:food_ordering_app/welcome/WelcomeScreen.dart';
import 'package:food_ordering_app/welcome/loginPage.dart';
import 'package:food_ordering_app/welcome/signupPage.dart';

void main() {
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
