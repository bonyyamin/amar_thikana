import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/user/user_notifier.dart';
import 'package:amar_thikana/application/providers/user/user_state.dart';

final userProvider = StateNotifierProvider<UserNotifier, UserState>(
  (ref) => UserNotifier(),
);
