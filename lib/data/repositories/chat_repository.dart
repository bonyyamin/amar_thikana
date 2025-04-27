import 'package:amar_thikana/domain/models/chat/conversation.dart';
import 'package:amar_thikana/domain/models/chat/message.dart';
import 'package:amar_thikana/domain/repository/chat_repository_interface.dart';

class ChatRepository implements ChatRepositoryInterface {
  final List<Conversation> _mockConversations = [
    Conversation(
      id: '1',
      userId: '101',
      userName: 'John Doe',
      userProfileImage: 'https://via.placeholder.com/150',
      messages: [
        Message(
          id: '1',
          senderId: '101',
          receiverId: '200',
          content: 'Hey there!',
          timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
          isMe: false,
        ),
        Message(
          id: '2',
          senderId: '200',
          receiverId: '101',
          content: 'Hello!',
          timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
          isMe: true,
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
    return _mockConversations.firstWhere((c) => c.id == conversationId).messages;
  }

  @override
  Future<void> sendMessage(String conversationId, Message message) async {
    _mockConversations.firstWhere((c) => c.id == conversationId).messages.add(message);
  }
}
