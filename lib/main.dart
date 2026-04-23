import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_auth_boilerplate/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'core/configs/router-configs/router.dart';
import 'core/services/deep_link_service.dart';
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
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
          secondary: Colors.white70,
          surface: Color(0xFF1A237E),
          onSurface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A237E),
          elevation: 0,
        ),
        scaffoldBackgroundColor: const Color(0xFF0D1344),
        cardTheme: CardThemeData(
          color: const Color(0xFF1A237E),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: Colors.white.withValues(alpha: 0.1),
          backgroundColor: const Color(0xFF1A237E),
        ),
      ),
      routerConfig: router,
    );
  }
}
