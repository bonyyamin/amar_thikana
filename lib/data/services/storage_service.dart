import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

class StorageService {
  final FirebaseStorage _storage;

  StorageService(this._storage);

  Future<List<String>> uploadPropertyImages(
    String userId,
    List<File> images,
  ) async {
    List<String> imageUrls = [];

    for (var image in images) {
      final fileName = path.basename(image.path);
      final destination = 'properties/$userId/$fileName';
      final ref = _storage.ref(destination);

      try {
        await ref.putFile(image);
        final url = await ref.getDownloadURL();
        imageUrls.add(url);
      } catch (e) {
        throw Exception('Failed to upload image: $e');
      }
    }

    return imageUrls;
  }

  Future<void> deleteFile(String fileUrl) async {
    try {
      final ref = _storage.refFromURL(fileUrl);
      await ref.delete();
    } catch (e) {
      throw Exception('Failed to delete file: $e');
    }
  }
}
