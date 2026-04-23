import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_auth_boilerplate/presentation/onboarding/controllers/onboarding/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_auth_boilerplate/core/configs/router-configs/route_names.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Welcome to the App',
          body: 'This is a starter boilerplate with authentication.',
          image: const FlutterLogo(size: 100),
        ),
        PageViewModel(
          title: 'Clean Architecture',
          body: 'Built with industry standard clean architecture principles.',
          image: const FlutterLogo(size: 100),
        ),
        PageViewModel(
          title: 'Ready to Start',
          body: 'Sign in to explore the features.',
          image: const FlutterLogo(size: 100),
        ),
      ],
      showNextButton: true,
      next: const Text('Next'),
      done: const Text('Get Started'),
      onDone: () => _onDone(context, ref),
    );
  }

  void _onDone(BuildContext context, WidgetRef ref) async {
    await ref.read(hasSeenOnboardingProvider.notifier).setHasSeenOnboarding();
    if (context.mounted) {
      context.goNamed(RouteNames.home);
    }
  }
}
