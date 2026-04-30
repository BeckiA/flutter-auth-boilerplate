import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_auth_boilerplate/core/services/secure_storage_service.dart';
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

  await _initializeSupabase();
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

Future<void> _initializeSupabase() async {
  const storage = SecureStorageService();
  final config = await storage.getSupabaseConfig();
  final url = config['url'];
  final anonKey = config['anonKey'];

  if (url != null && anonKey != null && url.isNotEmpty && anonKey.isNotEmpty) {
    await Supabase.initialize(
      url: url,
      anonKey: anonKey,
    );
  } else {
    debugPrint('Supabase configuration missing in SecureStorage.');
    // Note: You can set these keys using SecureStorageService().saveSupabaseConfig(url: ..., anonKey: ...)
  }
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
