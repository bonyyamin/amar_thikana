import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:amar_thikana/domain/models/chat/conversation.dart';

part 'conversations_state.freezed.dart';

@freezed
class ConversationsState with _$ConversationsState {
  const factory ConversationsState.loading() = _Loading;
  const factory ConversationsState.loaded(List<Conversation> conversations) = _Loaded;
  const factory ConversationsState.error(String message) = _Error;
}
