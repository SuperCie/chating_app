import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatTile extends StatelessWidget {
  void Function()? onTap;
  final String text;
  ChatTile({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            // profile yang chat
            const Icon(Icons.person),
            const SizedBox(
              width: 20,
            ),
            // Nama yang chat
            Text(text)
          ],
        ),
      ),
    );
  }
}
