import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_auth_boilerplate/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'core/configs/router-configs/router.dart';
import 'core/services/deep_link_service.dart';
import 'core/theme/app_theme.dart';
import 'presentation/onboarding/controllers/onboarding/onboarding_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sh = await SharedPreferences.getInstance();
  await _initializeFirebase();
  await GoogleSignIn.instance.initialize();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sh),
      ],
      child: const MyApp(),
    ),
  );
}

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Initialize DeepLinkService to listen for incoming links
    ref.listen(deepLinkServiceProvider, (_, __) {});

    final router = ref.watch(routeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth Boilerplate',
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
