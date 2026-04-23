import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_auth_boilerplate/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final hasSeenOnboardingProvider = NotifierProvider<HasSeenOnboarding, bool>(HasSeenOnboarding.new);

class HasSeenOnboarding extends Notifier<bool> {
  @override
  bool build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return prefs.getBool(hasOnboardingInitialized) ?? false;
  }

  Future<void> setHasSeenOnboarding() async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setBool(hasOnboardingInitialized, true);
    state = true;
  }
}
