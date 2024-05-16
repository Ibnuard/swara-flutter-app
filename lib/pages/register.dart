import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swara/components/button.dart';
import 'package:swara/components/text_field.dart';
import 'package:swara/helper/helper_func.dart';

class Register extends StatefulWidget {
  final void Function()? onTap;

  const Register({super.key, required this.onTap});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Input controller
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void onRegister() async {
    // show circular dialog modal
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    // check is password match
    if (passwordController.text != confirmPasswordController.text) {
      // pop loading circle
      Navigator.pop(context);

      // display error to user
      displayErrorToUser("Password doesn,t match!", context);
      return;
    }

    // try creating user
    try {
      UserCredential? userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      // Pop Loading
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Pop loading
      Navigator.pop(context);

      // display error message to user
      displayErrorToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // logo
            Icon(
              Icons.person,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

            // title
            const Text("Swara", style: TextStyle(fontSize: 20)),

            const SizedBox(height: 50),

            // input username
            CustomTextField(
                hintText: "Username",
                isSecured: false,
                controller: usernameController),

            const SizedBox(height: 14),

            // input email
            CustomTextField(
                hintText: "Email",
                isSecured: false,
                controller: emailController),

            const SizedBox(height: 14),

            // input password
            CustomTextField(
                hintText: "Password",
                isSecured: true,
                controller: passwordController),

            const SizedBox(height: 14),

            // input confirm password
            CustomTextField(
                hintText: "Confirm Password",
                isSecured: true,
                controller: confirmPasswordController),

            const SizedBox(height: 48),

            // sign button
            CustomButton(title: "Sign Up", onTap: onRegister),

            const SizedBox(height: 14),

            // dont have acc label
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    "Login Here",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
