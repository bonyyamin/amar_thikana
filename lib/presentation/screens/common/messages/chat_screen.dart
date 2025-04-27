import 'package:amar_thikana/presentation/screens/common/messages/widgets/chat_input.dart';
import 'package:amar_thikana/presentation/screens/common/messages/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/messaging/chat_provider.dart';


class ChatScreen extends ConsumerWidget {
  final String conversationId;

  const ChatScreen({super.key, required this.conversationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatState = ref.watch(chatProvider(conversationId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: chatState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e) => Center(child: Text('Error: $e')),
              loaded: (messages) => ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[messages.length - 1 - index];
                  return MessageBubble(message: message);
                },
              ),
            ),
          ),
          ChatInput(conversationId: conversationId),
        ],
      ),
    );
  }
}
