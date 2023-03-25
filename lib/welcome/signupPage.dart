import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'TextField.dart';

class SingUpPagge extends StatefulWidget {
  @override
  State<SingUpPagge> createState() => _SingUpPaggeState();
}

class _SingUpPaggeState extends State<SingUpPagge> {
  bool showPassword = true;
  bool loading = false;
  GlobalKey<ScaffoldState> globalKey = GlobalKey();
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  bool validation() {
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (firstName.text.trim().isEmpty) {
      showToast("first Name is empty");
      return false;
    } else if (lastName.text.trim().isEmpty) {
      showToast("Last Name is empty");
      return false;
    } else if (email.text.trim().isEmpty) {
      showToast("Email Name is empty ");
      return false;
    }
    if (password.text.trim().isEmpty) {
      showToast("Password Name is empty");
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
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
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    MyTextField(
                        "First Name", Icon(Icons.person), false, firstName),
                    MyTextField(
                        "Last Name", Icon(Icons.person), false, lastName),
                    MyTextField("Email", Icon(Icons.email), false, email),
                    TextFormField(
                      obscureText: showPassword,
                      controller: password,
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(showPassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                          ),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                  ],
                ),
              ),
              loading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [CircularProgressIndicator()],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        button("Cancel", Colors.black, Colors.white, context),
                        const SizedBox(
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
            Navigator.pushNamed(context, 'welcomeScreen');
          } else {
            if (validation()) {
              setState(() {
                loading = true;
              });
              signUp();
            }
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

  Future signUp() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      showToast("Sign Up Successful");
      saveUserData();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast("he password provided is too weak.");
        showToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showToast('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    setState(() {
      loading = false;
    });
  }

  Future saveUserData() async {
    FirebaseFirestore.instance.collection("userData").doc().set({
      "firstName": firstName.text,
      "lastName": lastName.text,
      "email": email.text,
      "password": password.text
    });
    print("Data Store");
  }
}
