import 'package:flutter/material.dart';
import 'package:amar_thikana/domain/models/chat/message.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final String currentUserId; // Pass the current user's ID

  const MessageBubble({super.key, required this.message, required this.currentUserId});

  @override
  Widget build(BuildContext context) {
    final bool isMe = message.senderId == currentUserId; // Check if sender is the current user

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: isMe ? Colors.blueAccent : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message.content,
          style: TextStyle(color: isMe ? Colors.white : Colors.black87),
        ),
      ),
    );
  }
}