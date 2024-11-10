import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial_line/components/theme/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: const Text(
            "Setting Page",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.all(25),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //dark mode
              const Text(
                "Dark Mode",
                style: TextStyle(fontSize: 20),
              ),
              // switch
              CupertinoSwitch(
                value: Provider.of<ThemeProvider>(context, listen: false)
                    .isDarkTheme,
                onChanged: (value) =>
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toogleTheme(),
              )
            ],
          ),
        ));
  }
}
