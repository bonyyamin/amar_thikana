import 'dart:convert';
import 'package:amar_thikana/core/storage/secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:amar_thikana/core/config/api_config.dart';
import 'package:amar_thikana/domain/models/chat/conversation.dart';
import 'package:amar_thikana/domain/models/chat/message.dart';

final chatRemoteDataSourceProvider = Provider<ChatRemoteDataSource>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  return ChatRemoteDataSource(
    httpClient: http.Client(),
    secureStorage: secureStorage,
  );
});

class ChatRemoteDataSource {
  final http.Client httpClient;
  final SecureStorage secureStorage;

  // Constants for storage keys
  static const String _authTokenKey = 'auth_token';

  ChatRemoteDataSource({required this.httpClient, required this.secureStorage});

  // Base headers for API requests
  Future<Map<String, String>> _getHeaders() async {
    final token = await secureStorage.read(key: _authTokenKey);
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  /// Get all conversations for the current user
  Future<List<Conversation>> getConversations() async {
    try {
      final headers = await _getHeaders();
      final response = await httpClient.get(
        Uri.parse('${ApiConfig.baseUrl}/conversations'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Conversation.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load conversations: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  /// Get messages for a specific conversation
  Future<List<Message>> getMessages(String conversationId) async {
    try {
      final headers = await _getHeaders();
      final response = await httpClient.get(
        Uri.parse(
          '${ApiConfig.baseUrl}/conversations/$conversationId/messages',
        ),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Message.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load messages: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  /// Send a new message to a conversation
  Future<Message> sendMessage(String conversationId, Message message) async {
    try {
      final headers = await _getHeaders();
      final response = await httpClient.post(
        Uri.parse(
          '${ApiConfig.baseUrl}/conversations/$conversationId/messages',
        ),
        headers: headers,
        body: json.encode(message.toJson()),
      );

      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        return Message.fromJson(data);
      } else {
        throw Exception('Failed to send message: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  /// Create a new conversation
  Future<Conversation> createConversation(
    List<String> participants,
    String initialMessage,
  ) async {
    try {
      final headers = await _getHeaders();
      final response = await httpClient.post(
        Uri.parse('${ApiConfig.baseUrl}/conversations'),
        headers: headers,
        body: json.encode({
          'participants': participants,
          'initialMessage': initialMessage,
        }),
      );

      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        return Conversation.fromJson(data);
      } else {
        throw Exception(
          'Failed to create conversation: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  /// Mark messages as read in a conversation
  Future<void> markAsRead(String conversationId) async {
    try {
      final headers = await _getHeaders();
      final response = await httpClient.put(
        Uri.parse('${ApiConfig.baseUrl}/conversations/$conversationId/read'),
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception(
          'Failed to mark messages as read: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
