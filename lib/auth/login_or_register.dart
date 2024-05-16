import 'package:flutter/material.dart';
import 'package:swara/pages/login.dart';
import 'package:swara/pages/register.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // initially, show login page
  bool showloginPage = true;

  // toggle between login page and register page
  void togglePages() {
    setState(() {
      showloginPage = !showloginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginPage) {
      return Login(onTap: togglePages);
    } else {
      return Register(onTap: togglePages);
    }
  }
}
