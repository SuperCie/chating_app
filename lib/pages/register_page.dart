import 'package:flutter/material.dart';
import 'package:trial_line/components/auth/auth_service.dart';
import 'package:trial_line/components/models/mybutton.dart';
import 'package:trial_line/components/models/textfield_button.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController cfController = TextEditingController();
  void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context) {
    //get auth service
    final _auth = AuthService();

    if (pwController.text == cfController.text) {
      try {
        _auth.signUpWithEmailPassword(
          emailController.text,
          pwController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text(
            "Your password doest matching!\n"
            "Please try again",
            textAlign: TextAlign.center,
          ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Hi there!\n"
                      "Join us and start chatting with your friends.",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
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
                  const SizedBox(
                    height: 10,
                  ),
                  //confirm pw
                  FieldButton(
                      obscureText: true,
                      hintText: "Confirm Password",
                      controller: cfController),
                  //login button
                  const SizedBox(
                    height: 25,
                  ),
                  Mybutton(
                    text: "Register",
                    onTap: () => register(context),
                  ),
                  //register now
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account ? ",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                              fontSize: 15),
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: Text(
                            "Head over to Login Page",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
