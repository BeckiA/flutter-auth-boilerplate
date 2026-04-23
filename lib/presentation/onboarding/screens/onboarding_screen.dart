import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_auth_boilerplate/core/configs/router-configs/route_names.dart';
import 'package:flutter_auth_boilerplate/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      onDone: () => _onDone(context),
    );
  }

  void _onDone(BuildContext context) async {
    await _changeOnboardingIntialStatus();
    if (context.mounted) {
      context.goNamed(RouteNames.home);
    }
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (_) => const WorkoutListScreen()),
    // );

    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (_) => const WorkoutListScreen()),
    // );
  }

  Future<void> _changeOnboardingIntialStatus() async {
    final sh = await SharedPreferences.getInstance();
    sh.setBool(hasOnboardingInitialized, true);
  }
}
