import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final Icon icon;
  final bool textHidden;
  final TextEditingController textEditingController;
  const MyTextField(
      this.hint, this.icon, this.textHidden, this.textEditingController,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: textHidden,
      controller: textEditingController,
      decoration: InputDecoration(
          hintText: hint,
          prefixIcon: icon,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green))),
    );
  }
}
