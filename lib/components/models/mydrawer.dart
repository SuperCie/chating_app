import 'package:flutter/material.dart';
import 'package:trial_line/components/auth/auth_service.dart';
import 'package:trial_line/pages/home_page.dart';
import 'package:trial_line/pages/settings_page.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  void logout() {
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/images.png",
                  width: 150,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: const Icon(Icons.archive),
                  title: const Text("H O M E"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.archive),
                  title: const Text("S E T T I N G S"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsPage(),
                        ));
                  },
                ),
                ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text("L O G O U T"),
                    onTap: logout),
              ],
            )
          ],
        ),
      ),
    );
  }
}
