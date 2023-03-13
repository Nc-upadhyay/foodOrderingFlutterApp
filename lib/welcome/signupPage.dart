import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SingUpPagge extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
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
                      'Sign in',
                      textStyle: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ]),
                ),
                Column(
                  children: [
                    textfield("Name", Icon(Icons.person)),
                    SizedBox(
                      height: 10,
                    ),
                    textfield("UserName", Icon(Icons.person)),
                    SizedBox(
                      height: 10,
                    ),
                    textfield("Password", Icon(Icons.lock)),
                    SizedBox(
                      height: 10,
                    ),
                    textfield("Confirmed Password", Icon(Icons.password)),
                  ],
                ),
                Row(
                  children: [
                    button("Cancel", Colors.black, Colors.white),
                    SizedBox(
                      width: 50,
                    ),
                    button("Sign Up", Colors.white, Colors.green),
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

  Widget textfield(String hint, Icon icon) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hint,
          prefixIcon: icon,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green))),
    );
  }

  Widget button(String name, Color textColors, Color bg) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bg,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(
                    color: Color.fromARGB(255, 163, 76, 175), width: 2))),
        onPressed: () {},
        child: Text(name, style: TextStyle(fontSize: 20, color: textColors)));
  }
}
