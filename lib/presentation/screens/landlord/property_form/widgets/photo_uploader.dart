import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/property/property_form_provider.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PhotoUploader extends ConsumerWidget {
  const PhotoUploader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(propertyFormProvider);
    final formNotifier = ref.read(propertyFormProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Property Photos',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            children: [
              InkWell(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? image = await picker.pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 80,
                  );
                  
                  if (image != null && context.mounted) {
                    // TODO: Upload image to storage and get URL
                    formNotifier.updatePhotos([
                      ...formState.photos,
                      image.path,
                    ]);
                  }
                },
                child: Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_photo_alternate_outlined),
                      SizedBox(height: 4),
                      Text('Add Photo'),
                    ],
                  ),
                ),
              ),
              ...formState.photos.map(
                (photo) => _buildPhotoPreview(photo, formState.photos, formNotifier),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoPreview(
    String photoUrl, 
    List<String> currentPhotos,
    PropertyFormNotifier notifier,
  ) {
    return Stack(
      children: [
        Container(
          width: 100,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: photoUrl.startsWith('http') 
                  ? NetworkImage(photoUrl)
                  : FileImage(File(photoUrl)) as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 12,
          child: InkWell(
            onTap: () => notifier.updatePhotos(
              List<String>.from(currentPhotos)..remove(photoUrl)
            ),
            child: const CircleAvatar(
              radius: 12,
              backgroundColor: Colors.black54,
              child: Icon(Icons.close, size: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
