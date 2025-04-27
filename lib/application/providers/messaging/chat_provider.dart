import 'package:amar_thikana/application/providers/messaging/conversations_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/data/repositories/chat_repository.dart';
import 'package:amar_thikana/domain/models/chat/message.dart';
import 'package:amar_thikana/application/providers/messaging/chat_state.dart';

final chatProvider = StateNotifierProvider.family<ChatNotifier, ChatState, String>((ref, conversationId) {
  final repository = ref.watch(chatRepositoryProvider);
  return ChatNotifier(repository, conversationId);
});

class ChatNotifier extends StateNotifier<ChatState> {
  final ChatRepository repository;
  final String conversationId;

  ChatNotifier(this.repository, this.conversationId) : super(const ChatState.loading()) {
    loadMessages();
  }

  Future<void> loadMessages() async {
    try {
      final messages = await repository.getMessages(conversationId);
      state = ChatState.loaded(messages);
    } catch (e) {
      state = ChatState.error(e.toString());
    }
  }

  Future<void> sendMessage(String content) async {
    final message = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: '200', // Assume current user ID
      receiverId: '101', // Assume receiver
      content: content,
      timestamp: DateTime.now(),
      isMe: true,
    );

    await repository.sendMessage(conversationId, message);
    loadMessages();
  }
}
