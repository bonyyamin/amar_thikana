import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:amar_thikana/domain/models/chat/message.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.loading() = _Loading;
  const factory ChatState.loaded(List<Message> messages) = _Loaded;
  const factory ChatState.error(String message) = _Error;
}
