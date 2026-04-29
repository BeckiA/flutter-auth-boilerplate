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
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: const Color(0xFFE2E8F0)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: isLoading.value
                ? const Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                : TextButton(
                    onPressed: onSave,
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Avatar picker
            Center(
              child: Stack(
                children: [
                  _buildAvatar(
                    context,
                    selectedImagePath: selectedImagePath.value,
                    currentPhotoUrl: user?.photoUrl,
                    onPickImage: onPickImage,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Name field
            Text(
              'Name',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter your name',
              ),
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 24),
            // Bio field
            Text(
              'Bio',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: bioController,
              decoration: const InputDecoration(
                hintText: 'Tell us a bit about yourself',
                alignLabelWithHint: true,
              ),
              maxLines: 4,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 32),
            AppButton(
              text: 'Save Changes',
              onPressed: isLoading.value ? null : onSave,
              isLoading: isLoading.value,
            ),
          ],
        ),
      ),
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

    return Stack(
      children: [
        CircleAvatar(
          radius: 52,
          backgroundColor: const Color(0xFFE2E8F0),
          backgroundImage: imageProvider,
          child: imageProvider == null
              ? const Icon(Icons.person_outline, size: 46, color: Color(0xFF64748B))
              : null,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Material(
            color: Colors.black,
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
    );
  }
}
