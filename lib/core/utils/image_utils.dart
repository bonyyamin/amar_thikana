import 'dart:io';
import 'dart:typed_data';
import 'package:amar_thikana/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;
import 'package:uuid/uuid.dart';

/// Utility functions for handling images
class ImageUtils {
  /// Pick image from gallery
  static Future<File?> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  /// Pick image from camera
  static Future<File?> pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  /// Pick multiple images from gallery
  static Future<List<File>> pickMultipleImages({int maxImages = 10}) async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();
    
    // Limit the number of images
    final limitedFiles = pickedFiles.take(maxImages).toList();
    
    return limitedFiles.map((xFile) => File(xFile.path)).toList();
  }

  /// Compress image to reduce file size
  static Future<File> compressImage(File file, {int quality = 85}) async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    final uuid = const Uuid().v4();
    final targetPath = '$path/$uuid.jpg';

    final bytes = await file.readAsBytes();
    final image = img.decodeImage(bytes);
    
    if (image == null) {
      throw Exception('Could not decode image');
    }
    
    // Resize if image is too large
    img.Image resized;
    if (image.width > 1920 || image.height > 1920) {
      resized = img.copyResize(
        image,
        width: image.width > image.height ? 1920 : null,
        height: image.height >= image.width ? 1920 : null,
      );
    } else {
      resized = image;
    }
    
    // Encode as JPG with specified quality
    final compressedData = img.encodeJpg(resized, quality: quality);
    final compressedFile = File(targetPath);
    await compressedFile.writeAsBytes(compressedData);
    
    return compressedFile;
  }

  /// Create a thumbnail from image
  static Future<File> createThumbnail(File file) async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    final uuid = const Uuid().v4();
    final targetPath = '$path/$uuid-thumb.jpg';

    final bytes = await file.readAsBytes();
    final image = img.decodeImage(bytes);
    
    if (image == null) {
      throw Exception('Could not decode image');
    }
    
    // Create thumbnail
    final thumbnail = img.copyResize(
      image,
      width: ImageConstants.thumbnailWidth,
      height: ImageConstants.thumbnailHeight,
    );
    
    // Encode as JPG with good quality
    final thumbnailData = img.encodeJpg(thumbnail, quality: 90);
    final thumbnailFile = File(targetPath);
    await thumbnailFile.writeAsBytes(thumbnailData);
    
    return thumbnailFile;
  }

  /// Convert File to Uint8List
  static Future<Uint8List> fileToUint8List(File file) async {
    return await file.readAsBytes();
  }

  /// Get file size in MB
  static double getFileSizeInMB(File file) {
    final bytes = file.lengthSync();
    return bytes / (1024 * 1024);
  }

  /// Check if file size exceeds limit
  static bool isFileSizeExceeded(File file, {int maxSizeInBytes = ImageConstants.maxImageSize}) {
    final bytes = file.lengthSync();
    return bytes > maxSizeInBytes;
  }

  /// Check if file extension is allowed
  static bool isFileExtensionAllowed(File file) {
    final extension = file.path.split('.').last.toLowerCase();
    return ImageConstants.allowedImageExtensions.contains(extension);
  }

  /// Get placeholder image widget
  static Widget getPlaceholderImage({
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[300],
      child: Icon(
        Icons.image,
        color: Colors.grey[600],
        size: (width ?? 100) * 0.5,
      ),
    );
  }

  /// Get error image widget
  static Widget getErrorImage({
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[300],
      child: Icon(
        Icons.broken_image,
        color: Colors.red[400],
        size: (width ?? 100) * 0.5,
      ),
    );
  }
}