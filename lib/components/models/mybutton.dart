import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Mybutton extends StatelessWidget {
  final String text;
  void Function()? onTap;
  Mybutton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.secondary),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
