import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/messaging/chat_provider.dart';

class ChatInput extends ConsumerStatefulWidget {
  final String conversationId;

  const ChatInput({Key? key, required this.conversationId}) : super(key: key);

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
                ref.read(chatProvider(widget.conversationId).notifier).sendMessage(_controller.text.trim());
                _controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
