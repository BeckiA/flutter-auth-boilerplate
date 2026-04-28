import 'package:flutter/material.dart';
import 'package:flutter_auth_boilerplate/core/configs/router-configs/route_names.dart';
import 'package:flutter_auth_boilerplate/core/helpers/src/error_toaster.dart';
import 'package:flutter_auth_boilerplate/presentation/auth/controller/auth/auth_provider.dart';
import 'package:flutter_auth_boilerplate/widgets/app_button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResetPasswordScreen extends HookConsumerWidget {
  final String oobCode;
  const ResetPasswordScreen({super.key, required this.oobCode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final isPasswordVisible = useState(false);
    final isConfirmPasswordVisible = useState(false);
    final isSubmitting = useState(false);

    String? validatePassword(String? value) {
      if (value == null || value.isEmpty) {
        return 'Password is required';
      }
      if (value.length < 6) {
        return 'Password must be at least 6 characters';
      }
      return null;
    }

    String? validateConfirmPassword(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please confirm your password';
      }
      if (value != passwordController.text) {
        return 'Passwords do not match';
      }
      return null;
    }

    Future<void> onSubmit() async {
      if (isSubmitting.value) return;
      if (formKey.currentState?.validate() != true) return;
      isSubmitting.value = true;
      final error =
          await ref.read(authNotifierProvider.notifier).confirmPasswordReset(
                oobCode,
                passwordController.text,
              );
      if (!context.mounted) return;
      isSubmitting.value = false;

      if (error != null) {
        ErrorToaster.showError(context, message: error);
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset successful. Please sign in.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      context.goNamed(RouteNames.signIn);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                Text(
                  'Set a new password for your account.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible.value,
                  textInputAction: TextInputAction.next,
                  validator: validatePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'New Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () =>
                          isPasswordVisible.value = !isPasswordVisible.value,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: !isConfirmPasswordVisible.value,
                  textInputAction: TextInputAction.done,
                  validator: validateConfirmPassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onFieldSubmitted: (_) => onSubmit(),
                  decoration: InputDecoration(
                    labelText: 'Confirm New Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfirmPasswordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () => isConfirmPasswordVisible.value =
                          !isConfirmPasswordVisible.value,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                AppButton(
                  text: 'Reset Password',
                  onPressed: isSubmitting.value ? null : onSubmit,
                  isLoading: isSubmitting.value,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
