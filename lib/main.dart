import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:swara/auth/auth.dart';
import 'package:swara/auth/login_or_register.dart';
import 'package:swara/firebase_options.dart';
import 'package:swara/pages/home.dart';
import 'package:swara/pages/profile.dart';
import 'package:swara/pages/user.dart';
import 'package:swara/theme/dark_mode.dart';
import 'package:swara/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: const AuthPage(),
      darkTheme: darkMode,
      routes: {
        '/auth': (context) => const LoginOrRegister(),
        '/home': (context) => const Home(),
        '/profile': (context) => const Profile(),
        '/user': (context) => const User()
      },
    );
  }
}
