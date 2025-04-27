import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:amar_thikana/domain/models/user/user.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.loading() = _Loading;
  const factory UserState.loaded(User user) = _Loaded;
  const factory UserState.error(String message) = _Error;
}
