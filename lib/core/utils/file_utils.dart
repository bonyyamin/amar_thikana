import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:mime/mime.dart';
import '../errors/error_handler.dart';

class FileUtils {
  static bool isImage(File file) {
    final mimeType = lookupMimeType(file.path);
    return mimeType?.startsWith('image/') ?? false;
  }

  static bool isVideo(File file) {
    final mimeType = lookupMimeType(file.path);
    return mimeType?.startsWith('video/') ?? false;
  }

  static String getFileExtension(File file) {
    return path.extension(file.path).toLowerCase();
  }

  static String getFileName(File file) {
    return path.basename(file.path);
  }

  static Future<int> getFileSize(File file) async {
    try {
      return await file.length();
    } catch (e) {
      throw ValidationError('Could not get file size');
    }
  }

  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  static Future<bool> validateImageFile(
    File file, {
    int maxSizeInMB = 5,
  }) async {
    if (!isImage(file)) {
      throw ValidationError('Selected file is not an image');
    }

    final size = await getFileSize(file);
    if (size > maxSizeInMB * 1024 * 1024) {
      throw ValidationError('Image size should not exceed ${maxSizeInMB}MB');
    }

    return true;
  }

  static Future<bool> validateVideoFile(
    File file, {
    int maxSizeInMB = 50,
  }) async {
    if (!isVideo(file)) {
      throw ValidationError('Selected file is not a video');
    }

    final size = await getFileSize(file);
    if (size > maxSizeInMB * 1024 * 1024) {
      throw ValidationError('Video size should not exceed ${maxSizeInMB}MB');
    }

    return true;
  }

  static String generateFileName(String originalFileName) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final extension = path.extension(originalFileName);
    final baseName = path
        .basenameWithoutExtension(originalFileName)
        .replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_');
    return '${baseName}_$timestamp$extension';
  }
}
