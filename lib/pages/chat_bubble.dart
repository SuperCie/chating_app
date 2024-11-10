import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final bool isCurrentUser;
  final String message;
  const ChatBubble(
      {super.key, required this.isCurrentUser, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color:
                isCurrentUser ? const Color(0xFF4CAF50) : Colors.grey.shade600,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            message,
            style:
                TextStyle(color: isCurrentUser ? Colors.black : Colors.white),
          ),
        ),
      ],
    );
  }
}
