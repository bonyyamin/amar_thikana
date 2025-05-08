import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  FirebaseService(FirebaseFirestore watch, {FirebaseFirestore? firestore, FirebaseStorage? storage})
    : _firestore = firestore ?? FirebaseFirestore.instance,
      _storage = storage ?? FirebaseStorage.instance;

  FirebaseFirestore get firestore => _firestore;
  FirebaseStorage get storage => _storage;
}
