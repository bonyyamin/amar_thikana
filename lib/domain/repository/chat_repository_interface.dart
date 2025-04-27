import 'package:amar_thikana/domain/models/chat/conversation.dart';
import 'package:amar_thikana/domain/models/chat/message.dart';

abstract class ChatRepositoryInterface {
  Future<List<Conversation>> getConversations();
  Future<List<Message>> getMessages(String conversationId);
  Future<void> sendMessage(String conversationId, Message message);
}
