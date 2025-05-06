import 'package:amar_thikana/presentation/screens/common/messages/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/messaging/conversations_provider.dart';

class MessagesListScreen extends ConsumerWidget {
  const MessagesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(conversationsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Messages')),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e) => Center(child: Text('Error: $e')),
        loaded:
            (conversations) => ListView.builder(
              itemCount: conversations.length,
              itemBuilder: (context, index) {
                final conversation = conversations[index];
                final String firstParticipantId =
                    conversation.participants.first;
                final String userName =
                    conversation.participantNames[firstParticipantId] ??
                    'Unknown';
                final String? userProfileImage =
                    conversation.participantPhotos?[firstParticipantId];

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        userProfileImage != null
                            ? NetworkImage(userProfileImage)
                            : null,
                    child: userProfileImage == null ? Icon(Icons.person) : null,
                  ),
                  title: Text(userName),
                  subtitle: Text(
                    conversation.messages.isNotEmpty
                        ? conversation.messages.last.content
                        : '',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => ChatScreen(conversationId: conversation.id),
                      ),
                    );
                  },
                );
              },
            ),
      ),
    );
  }
}
