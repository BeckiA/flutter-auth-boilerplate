import 'package:flutter/material.dart';
import 'package:flutter_auth_boilerplate/core/helpers/src/error_toaster.dart';
import 'package:flutter_auth_boilerplate/presentation/auth/controller/auth/auth_provider.dart';
import 'package:flutter_auth_boilerplate/widgets/app_button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ForgotPasswordScreen extends HookConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final isSubmitting = useState(false);

    String? validateEmail(String? value) {
      if (value == null || value.trim().isEmpty) {
        return 'Email is required';
      }
      if (!value.contains('@') || !value.contains('.')) {
        return 'Please enter a valid email';
      }
      return null;
    }

    Future<void> onSubmit() async {
      if (isSubmitting.value) return;
      if (formKey.currentState?.validate() != true) return;
      isSubmitting.value = true;
      final error = await ref
          .read(authNotifierProvider.notifier)
          .sendPasswordResetEmail(emailController.text.trim());
      if (!context.mounted) return;
      isSubmitting.value = false;

      if (error != null) {
        ErrorToaster.showError(context, message: error);
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset email sent. Check your inbox.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 60),
                Text(
                  'Forgot Password',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter your account email and we will send you a link to reset your password.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).textTheme.labelSmall?.color,
                      ),
                ),
                const SizedBox(height: 48),
                Text(
                  'Email',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  validator: validateEmail,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onFieldSubmitted: (_) => onSubmit(),
                ),
                const SizedBox(height: 32),
                AppButton(
                  text: 'Send Reset Link',
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
