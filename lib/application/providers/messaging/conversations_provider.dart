import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/data/repositories/chat_repository.dart';
import 'package:amar_thikana/application/providers/messaging/conversations_state.dart';

final chatRepositoryProvider = Provider((ref) => ChatRepository());

final conversationsProvider = StateNotifierProvider<ConversationsNotifier, ConversationsState>((ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return ConversationsNotifier(repository);
});

class ConversationsNotifier extends StateNotifier<ConversationsState> {
  final ChatRepository repository;

  ConversationsNotifier(this.repository) : super(const ConversationsState.loading()) {
    loadConversations();
  }

  Future<void> loadConversations() async {
    try {
      final conversations = await repository.getConversations();
      state = ConversationsState.loaded(conversations);
    } catch (e) {
      state = ConversationsState.error(e.toString());
    }
  }
}
