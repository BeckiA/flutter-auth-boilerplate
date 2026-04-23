import 'package:flutter/material.dart';
import 'package:flutter_auth_boilerplate/widgets/app_button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

    Future<void> onSave() async {
      if (nameController.text.isEmpty) return;

      isLoading.value = true;
      try {
        await ref.read(authNotifierProvider.notifier).updateProfile(
              name: nameController.text,
              bio: bioController.text,
            );
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
}
