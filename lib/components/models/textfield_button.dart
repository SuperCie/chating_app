import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FieldButton extends StatelessWidget {
  bool obscureText;
  final String hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  FieldButton(
      {super.key,
      required this.obscureText,
      required this.hintText,
      required this.controller,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          fillColor: Theme.of(context).colorScheme.secondary,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        controller: controller,
        focusNode: focusNode,
      ),
    );
  }
}
