import 'package:flutter/material.dart';
import 'package:trial_line/components/auth/auth_service.dart';
import 'package:trial_line/components/models/mybutton.dart';
import 'package:trial_line/components/models/textfield_button.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  //login method
  void login(BuildContext context) async {
    // auth service
    final authService = AuthService();
    // try login
    try {
      await authService.signInWithEmailPassword(
        emailController.text,
        pwController.text,
      );
    }
    // catch any erros
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Column(
                children: [
                  //Image of apps
                  Image.asset(
                    "assets/icons/app_icon.png",
                    width: 275,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //Welcome Text
                  Text(
                    "Welcome back! Let's continue the conversation.",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontSize: 15),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //Email and Password Field
                  FieldButton(
                    obscureText: false,
                    hintText: "Email",
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FieldButton(
                      obscureText: true,
                      hintText: "Password",
                      controller: pwController),
                  //login button
                  const SizedBox(
                    height: 25,
                  ),
                  Mybutton(
                    text: "Login",
                    onTap: () => login(context),
                  ),
                  //register now
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont have a account yet ? ",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: Text(
                          "Register now!",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
