import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swara/auth/login_or_register.dart';
import 'package:swara/pages/home.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // if user logged in
          if (snapshot.hasData) {
            return const Home();
          }
          // on Not Logged In
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
