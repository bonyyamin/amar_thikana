import 'package:amar_thikana/domain/models/chat/conversation.dart';
import 'package:amar_thikana/domain/models/chat/message.dart';
import 'package:amar_thikana/domain/repository/chat_repository_interface.dart';

class ChatRepository implements ChatRepositoryInterface {
  final List<Conversation> _mockConversations = [
    Conversation(
      id: '1',
      participants: ['101', '200'], // List of user IDs
      participantNames: {
        '101': 'John Doe',
        '200': 'Jane Smith',
      }, // Map of user IDs to names
      participantPhotos: {
        '101': 'https://via.placeholder.com/150',
        '200': 'https://via.placeholder.com/150',
      },
      lastMessageText: 'Hello!',
      lastMessageTime: DateTime.now().subtract(const Duration(minutes: 3)),
      unreadStatus: {'101': false, '200': true},
      messages: [
        Message(
          id: '1',
          conversationId: '1',
          senderId: '101',
          senderName: 'John Doe',
          type: MessageType.text,
          content: 'Hey there!',
          timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
          readStatus: {'200': false},
          recipients: ['200'],
        ),
        Message(
          id: '2',
          conversationId: '1',
          senderId: '200',
          senderName: 'Jane Smith',
          type: MessageType.text,
          content: 'Hello!',
          timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
          readStatus: {'101': false},
          recipients: ['101'],
        ),
      ],
    ),
  ];

  @override
  Future<List<Conversation>> getConversations() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockConversations;
  }

  @override
  Future<List<Message>> getMessages(String conversationId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockConversations
        .firstWhere((c) => c.id == conversationId)
        .messages;
  }

  @override
  Future<void> sendMessage(String conversationId, Message message) async {
    final conversationIndex = _mockConversations.indexWhere(
      (c) => c.id == conversationId,
    );
    if (conversationIndex == -1) return;

    final conversation = _mockConversations[conversationIndex];

    // Create a new conversation instance with updated values
    final updatedConversation = conversation.copyWith(
      messages: [...conversation.messages, message], // Add new message
      lastMessageText: message.content,
      lastMessageTime: message.timestamp,
      unreadStatus: {
        ...conversation.unreadStatus,
        for (var recipient in message.recipients ?? []) recipient: true,
      },
    );

    // Replace the old conversation with the updated one
    _mockConversations[conversationIndex] = updatedConversation;
  }
}
