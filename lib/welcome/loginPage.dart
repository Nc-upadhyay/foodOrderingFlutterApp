import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_ordering_app/homeScreen.dart';
import 'package:food_ordering_app/welcome/TextField.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  bool loader = false;
  TextEditingController userName = TextEditingController();

  TextEditingController password = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2b2b2b),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child:
        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            height: 50,
            margin: EdgeInsets.only(right: 180),
            child: AnimatedTextKit(repeatForever: true, animatedTexts: [
              FadeAnimatedText(
                'Log In',
                textStyle: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ]),
          ),
          Column(
            children: [
              MyTextField("Email", Icon(Icons.email), false, userName),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                obscureText: _obscureText,
                controller: password,
                decoration: InputDecoration(
                    hintText: "Enter Password",
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                        showToast("${userName.text}  ${password.text}");
                      },
                    ),
                    prefixIcon: Icon(Icons.lock),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))),
              )
            ],
          ),
          loader ? Row(mainAxisAlignment: MainAxisAlignment.center,
            children: const [CircularProgressIndicator()]):Container(
            height: 40,
            width: 200,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.green, width: 2))),
                onPressed: () {
                  if (validataion()) {
                    setState(() {
                      loader=true;
                    });
                    signInUsingEmailPassword();
                  }
                },
                child: Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  WavyAnimatedText("Don't have account?",
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))
                ],
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "signUp");
                  },
                  child: const Text(
                    "Register Now.",
                    style: TextStyle(fontSize: 15),
                  ))
            ],
          )
        ]),
      ),
    );
  }

  Future signInUsingEmailPassword() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    User user;
    try {
      UserCredential userCredential =
      await firebaseAuth.signInWithEmailAndPassword(
          email: userName.text.trim(), password: password.text.trim());
      user = userCredential.user!;
      Navigator.pushNamed(context, "home");
      showToast("Login Successful");

      setState(() {
        loader=false;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast('No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showToast('Wrong password provided.');
        print('Wrong password provided.');
      }
    }
    loader=false;
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

  bool validataion() {
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (userName.text
        .trim()
        .isEmpty) {
      showToast("User Name can't be empty");
      return false;
    } else if (password.text
        .trim()
        .isEmpty) {
      showToast("Password can't be empty");
      return false;
    } else if (!emailRegExp.hasMatch(userName.text)) {
      showToast("Enter valid password");
      return false;
    }

    return true;
  }
}
