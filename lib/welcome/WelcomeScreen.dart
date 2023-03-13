import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/welcome/loginPage.dart';

class WelcomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: Center(child: Image.asset('images/logo.jpg'))),
            Expanded(
                child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Welcome To Foody',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  Column(
                    children: [
                      const Text("Order food from our restaurent and"),
                      const Text("Get fresh and testee food "),
                    ],
                  ),
                  button("Login", Colors.green, Colors.white, context),
                  button("Sign Up", Colors.white, Colors.green, context)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget button(
      String name, Color color, Color textColor, BuildContext context) {
    return SizedBox(
        height: 40,
        width: 300,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.green, width: 2))),
            onPressed: () {
              if (name == "Login") {
                Navigator.pushNamed(context, 'login');
              } else {
                Navigator.pushNamed(context, "signUp");
              }
            },
            child: Text(
              name,
              style: TextStyle(fontSize: 20, color: textColor),
            )));
  }
}
