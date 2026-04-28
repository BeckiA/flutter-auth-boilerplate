import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth_boilerplate/widgets/app_button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../controller/auth/auth_provider.dart';

class EditProfileScreen extends HookConsumerWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authNotifierProvider).mapOrNull(
          success: (success) => success.user,
        );
    final nameController = useTextEditingController(text: user?.name);
    final bioController = useTextEditingController(text: user?.bio);
    final isLoading = useState(false);
    final selectedImagePath = useState<String?>(null);
    final imagePicker = useMemoized(ImagePicker.new);

    Future<void> onPickImage() async {
      final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      selectedImagePath.value = pickedImage.path;
    }

    Future<void> onSave() async {
      if (nameController.text.isEmpty) return;

      isLoading.value = true;
      try {
        final error = await ref.read(authNotifierProvider.notifier).updateProfile(
              name: nameController.text,
              bio: bioController.text.trim(),
              imagePath: selectedImagePath.value,
            );
        if (error != null && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error)),
          );
          return;
        }
        if (context.mounted) {
          Navigator.pop(context);
        }
      } finally {
        isLoading.value = false;
      }
    }

    return Scaffold(
      appBar: _buildAppBar(isLoading, onSave),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildAvatar(
              context,
              selectedImagePath: selectedImagePath.value,
              currentPhotoUrl: user?.photoUrl,
              onPickImage: onPickImage,
            ),
            const SizedBox(height: 16),
            _buildNameField(nameController),
            const SizedBox(height: 16),
            _buildBioField(bioController),
            const SizedBox(height: 24),
            _buildSaveChangesBtn(isLoading, onSave),
          ],
        ),
      ),
    );
  }

  AppButton _buildSaveChangesBtn(
      ValueNotifier<bool> isLoading, Future<void> Function() onSave) {
    return AppButton(
      text: 'Save Changes',
      onPressed: isLoading.value ? null : onSave,
      isLoading: isLoading.value,
    );
  }

  TextField _buildBioField(TextEditingController bioController) {
    return TextField(
      controller: bioController,
      decoration: const InputDecoration(
        labelText: 'Bio',
        border: OutlineInputBorder(),
      ),
      maxLines: 3,
      textCapitalization: TextCapitalization.sentences,
    );
  }

  TextField _buildNameField(TextEditingController nameController) {
    return TextField(
      controller: nameController,
      decoration: const InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(),
      ),
      textCapitalization: TextCapitalization.words,
    );
  }

  AppBar _buildAppBar(
      ValueNotifier<bool> isLoading, Future<void> Function() onSave) {
    return AppBar(
      title: const Text('Edit Profile'),
      actions: [
        IconButton(
          icon: isLoading.value
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.save),
          onPressed: isLoading.value ? null : onSave,
        ),
      ],
    );
  }

  Widget _buildAvatar(
    BuildContext context, {
    required String? selectedImagePath,
    required String? currentPhotoUrl,
    required Future<void> Function() onPickImage,
  }) {
    ImageProvider? imageProvider;
    if (selectedImagePath != null && selectedImagePath.isNotEmpty) {
      imageProvider = FileImage(File(selectedImagePath));
    } else if (currentPhotoUrl != null && currentPhotoUrl.isNotEmpty) {
      imageProvider = NetworkImage(currentPhotoUrl);
    }

    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 52,
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
            backgroundImage: imageProvider,
            child: imageProvider == null
                ? const Icon(Icons.person_outline, size: 46)
                : null,
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Material(
              color: Theme.of(context).colorScheme.primary,
              shape: const CircleBorder(),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: onPickImage,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.photo_library_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
