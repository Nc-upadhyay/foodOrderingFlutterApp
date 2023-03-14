import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'TextField.dart';

class SingUpPagge extends StatefulWidget {
  @override
  State<SingUpPagge> createState() => _SingUpPaggeState();
}

class _SingUpPaggeState extends State<SingUpPagge> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey();
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  void validation() {
    if (firstName.text.trim().isEmpty || firstName.text.trim() == null) {
      showToast("first Name is empty");
      return;
    } else if (lastName.text.trim().isEmpty || lastName.text.trim() == null) {
      showToast("Last Name is empty");
      return;
    } else if (email.text.trim().isEmpty || email.text.trim() == null) {
      showToast("Email Name is empty");
      return;
    }
    if (password.text.trim().isEmpty || password.text.trim() == null) {
      showToast("Password Name is empty");
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100,
                  child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                    FadeAnimatedText(
                      'Sign up',
                      textStyle: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ]),
                ),
                Column(
                  children: [
                    MyTextField(
                        "First Name", Icon(Icons.person), false, firstName),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextField(
                        "Last Name", Icon(Icons.person), false, lastName),
                    SizedBox(
                      height: 10,
                    ),
                    MyTextField("Email", Icon(Icons.email), false, email),
                    SizedBox(
                      height: 10,
                    ),
                    MyTextField("Passowrd", Icon(Icons.lock), true, password),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    button("Cancel", Colors.black, Colors.white, context),
                    SizedBox(
                      width: 50,
                    ),
                    button("Sign Up", Colors.white, Colors.green, context),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        WavyAnimatedText("Create Account",
                            textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black))
                      ],
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }

  Widget button(String name, Color textColors, Color bg, BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bg,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(
                    color: Color.fromARGB(255, 163, 76, 175), width: 2))),
        onPressed: () {
          if (name == "Cancel") {
            Navigator.pushNamed(context, 'home');
          } else {
            validation();
          }
        },
        child: Text(name, style: TextStyle(fontSize: 20, color: textColors)));
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
