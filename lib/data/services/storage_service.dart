import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import '../../core/utils/file_utils.dart';
import '../../core/errors/error_handler.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadPropertyImage(String ownerId, File image) async {
    try {
      await FileUtils.validateImageFile(image);

      final fileName = FileUtils.generateFileName(image.path);
      final ref = _storage
          .ref()
          .child('properties')
          .child(ownerId)
          .child('images')
          .child(fileName);

      final uploadTask = ref.putFile(
        image,
        SettableMetadata(
          contentType: 'image/${path.extension(image.path).substring(1)}',
        ),
      );

      final snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      throw DatabaseError('Failed to upload image: ${e.toString()}');
    }
  }

  Future<List<String>> uploadPropertyImages(
    String ownerId,
    List<File> images,
  ) async {
    final uploadedUrls = <String>[];

    for (final image in images) {
      final url = await uploadPropertyImage(ownerId, image);
      uploadedUrls.add(url);
    }

    return uploadedUrls;
  }

  Future<String> uploadPropertyVideo(String ownerId, File video) async {
    try {
      await FileUtils.validateVideoFile(video);

      final fileName = FileUtils.generateFileName(video.path);
      final ref = _storage
          .ref()
          .child('properties')
          .child(ownerId)
          .child('videos')
          .child(fileName);

      final uploadTask = ref.putFile(
        video,
        SettableMetadata(
          contentType: 'video/${path.extension(video.path).substring(1)}',
        ),
      );

      final snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      throw DatabaseError('Failed to upload video: ${e.toString()}');
    }
  }

  Future<String> uploadProfileImage(String userId, File image) async {
    try {
      await FileUtils.validateImageFile(image);

      final fileName = FileUtils.generateFileName(image.path);
      final ref = _storage
          .ref()
          .child('users')
          .child(userId)
          .child('profile')
          .child(fileName);

      final uploadTask = ref.putFile(
        image,
        SettableMetadata(
          contentType: 'image/${path.extension(image.path).substring(1)}',
        ),
      );

      final snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      throw DatabaseError('Failed to upload profile image: ${e.toString()}');
    }
  }

  Future<void> deleteFile(String url) async {
    try {
      final ref = _storage.refFromURL(url);
      await ref.delete();
    } catch (e) {
      throw DatabaseError('Failed to delete file: ${e.toString()}');
    }
  }

  Future<void> deletePropertyImages(
    String ownerId,
    List<String> imageUrls,
  ) async {
    for (final url in imageUrls) {
      await deleteFile(url);
    }
  }
}
