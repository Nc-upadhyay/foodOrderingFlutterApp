import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoginPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
              textField("User name/Email", Icon(Icons.email)),
              SizedBox(
                height: 30,
              ),
              textField('Password', Icon(Icons.lock))
            ],
          ),
          Container(
            height: 40,
            width: 200,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.green, width: 2))),
                onPressed: () {},
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

  Widget textField(String hint, Icon icon) {
    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.black,
          ),
          enabledBorder: const UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.green))),
    );
  }
}