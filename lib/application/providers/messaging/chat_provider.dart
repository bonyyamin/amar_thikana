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

  Future<void> sendMessage(String content, String currentUserId, List<String> recipients) async {
    final message = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      conversationId: conversationId,
      senderId: currentUserId, // Use actual current user ID
      senderName: 'User $currentUserId', // Placeholder for user name, should be fetched properly
      type: MessageType.text,
      content: content,
      timestamp: DateTime.now(),
      readStatus: {for (var recipient in recipients) recipient: false}, // Initialize unread status
      recipients: recipients, // Send to multiple recipients
    );

    await repository.sendMessage(conversationId, message);
    loadMessages();
  }
}