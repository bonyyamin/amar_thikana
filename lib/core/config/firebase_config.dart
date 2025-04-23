import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirebaseConfig {
  static FirebaseOptions get platformOptions {
    return FirebaseOptions(
      apiKey:
          dotenv.env['ANDROID_API_KEY'] ??
          'AIzaSyCDTPJeZ6bP1A-wmr5107IKgv5vO2QPO3Q',
      appId:
          dotenv.env['ANDROID_APP_ID'] ??
          '1:433937412282:android:2f8153bca799bed7059283',
      messagingSenderId:
          dotenv.env['ANDROID_MESSAGING_SENDER_ID'] ?? '433937412282',
      projectId: dotenv.env['PROJECT_ID'] ?? 'amar-thikana-d553f',
      storageBucket:
          dotenv.env['STORAGE_BUCKET'] ??
          'amar-thikana-d553f.firebasestorage.app',
    );
  }
}
