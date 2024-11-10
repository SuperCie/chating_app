import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trial_line/components/auth/loginorregister.dart';
import 'package:trial_line/pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // user logged in
            return HomePage();
          } else {
            // user is not logged in or fail
            return const LoginorRegister();
          }
        },
      ),
    );
  }
}
