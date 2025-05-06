import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/messaging/chat_provider.dart';

class ChatInput extends ConsumerStatefulWidget {
  final String conversationId;
  final String currentUserId; // Pass current user's ID
  final List<String> recipients; // Pass recipients' IDs

  const ChatInput({
    super.key,
    required this.conversationId,
    required this.currentUserId,
    required this.recipients,
  });

  @override
  _ChatInputState createState() => _ChatInputState();
}

class _ChatInputState extends ConsumerState<ChatInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Type a message...'),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              if (_controller.text.trim().isNotEmpty) {
                ref.read(chatProvider(widget.conversationId).notifier).sendMessage(
                  _controller.text.trim(),
                  widget.currentUserId, // Pass current user ID
                  widget.recipients, // Pass recipients list
                );
                _controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}