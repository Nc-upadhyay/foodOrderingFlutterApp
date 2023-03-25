import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/welcome/WelcomeScreen.dart';
import 'package:food_ordering_app/welcome/loginPage.dart';
import 'package:food_ordering_app/welcome/signupPage.dart';

import 'homeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'welcomeScreen': (context) => WelcomeScreen(),
        'login': (context) => LoginPage(),
        'signUp': (context) => SingUpPagge(),
        'home': (context) => const HomeScreen()
      },
      title: 'Flutter Demo',

      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (index, sncspshort) {
            if (sncspshort.hasData) {
              return HomeScreen();
            } else
              return LoginPage();
          }),
    );
  }
}
