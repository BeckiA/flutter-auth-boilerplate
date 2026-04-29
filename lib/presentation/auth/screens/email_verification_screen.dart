import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_auth_boilerplate/core/helpers/src/error_toaster.dart';
import 'package:flutter_auth_boilerplate/presentation/auth/controller/auth/auth_provider.dart';
import 'package:flutter_auth_boilerplate/widgets/app_button.dart';

class EmailVerificationScreen extends ConsumerWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final user = authState.maybeWhen(
      success: (user) => user,
      orElse: () => null,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton.icon(
              onPressed: () {
                ref.read(authNotifierProvider.notifier).signOut();
              },
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error,
              ),
              icon: const Icon(Icons.logout, size: 18),
              label: const Text('Logout'),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.mark_email_unread_outlined,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 40),
              Text(
                'Email Confirmed',
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'We have sent a verification email to\n${user?.email ?? 'your email'}.\nPlease check your inbox and click the link.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).textTheme.labelSmall?.color,
                    ),
              ),
              const SizedBox(height: 48),
              AppButton(
                text: "I've verified",
                onPressed: () async {
                  await ref.read(authNotifierProvider.notifier).checkEmailVerification();
                  
                  // Check state again after reload
                  final updatedUser = ref.read(authNotifierProvider).maybeWhen(
                    success: (user) => user,
                    orElse: () => null,
                  );
                  
                  if (updatedUser != null && !updatedUser.isEmailVerified) {
                    if (context.mounted) {
                      ErrorToaster.showError(context, message: 'Email still not verified. Please check your inbox.');
                    }
                  }
                },
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  ref.read(authNotifierProvider.notifier).resendVerificationEmail();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Verification email resent!')),
                  );
                },
                child: const Text('Resend Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
