import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon icon;
  final TextInputType inputType;
  final bool isObscureText;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.inputType,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          obscureText: isObscureText,
          decoration: InputDecoration(
            labelText: hintText,
            hintText: hintText,
            icon: icon,
          ),
        ),
      ],
    );
  }
}
