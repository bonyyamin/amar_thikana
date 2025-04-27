import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/property/property_form_provider.dart';

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
              // Add Photo Button
              InkWell(
                onTap: () async {
                  // TODO: Implement image picker
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
              // Photo Preview List
              ...formState.photos.map(
                (photo) => _buildPhotoPreview(photo, formNotifier),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoPreview(String photoUrl, PropertyFormNotifier notifier) {
    return Stack(
      children: [
        Container(
          width: 100,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(photoUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 12,
          child: InkWell(
            onTap: () {
              final updatedPhotos = List<String>.from(notifier.state.photos)
                ..remove(photoUrl);
              notifier.updatePhotos(updatedPhotos);
            },
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
