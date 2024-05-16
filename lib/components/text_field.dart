import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isSecured;
  final TextEditingController controller;

  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.isSecured,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
      ),
      obscureText: isSecured,
    );
  }
}
