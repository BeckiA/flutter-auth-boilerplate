part of 'router.dart';

FutureOr<String?> handleRedirect(
    BuildContext context, GoRouterState state, Ref<Object?> ref) {
  final matchedLocation = state.matchedLocation;
  final isSignin = matchedLocation == "/sign-in";
  final isSignup = matchedLocation == "/sign-up";
  final isSplashScreen = matchedLocation == "/splash-screen";
  final isOnboarding = matchedLocation == "/onboarding";

  final isPublicPage = isSignup || isSignin || isOnboarding || isSplashScreen;

  // check if the user has seen the onboarding screen
  final hasSeenOnboarding = _hasSeenOnboarding(ref);
  if (!hasSeenOnboarding && !isOnboarding && !isSplashScreen) {
    return "/onboarding";
  }

  // check if the user is logged in or not
  final authState = ref.read(authNotifierProvider);
  final user = authState.maybeMap(
    success: (state) => state.user,
    orElse: () => null,
  );
  final isAuthenticated = user != null;
  final isEmailVerified = user?.isEmailVerified ?? false;
  final isCheckingUser = authState.maybeMap(
    gettingSignedInUser: (_) => true,
    orElse: () => false,
  );

  final isEmailVerificationPage = state.matchedLocation == "/email-verification";

  // Special handling for Splash Screen
  if (isSplashScreen) {
    if (isCheckingUser) return null;
    if (isAuthenticated) {
      if (!isEmailVerified) return "/email-verification";
      return "/home";
    }
    if (!hasSeenOnboarding) return "/onboarding";
    return "/sign-in";
  }

  // If authenticated but not verified, force to verification page
  if (isAuthenticated && !isEmailVerified && !isEmailVerificationPage && !isPublicPage) {
    return "/email-verification";
  }

  // If authenticated and verified, and on verification page, go home
  if (isAuthenticated && isEmailVerified && isEmailVerificationPage) {
    return "/home";
  }

  // If authenticated and trying to access a public page, redirect to home
  if (isAuthenticated && isPublicPage) {
    if (!isEmailVerified) return "/email-verification";
    return "/home";
  }

  // If not authenticated and trying to access a private page, redirect to sign-in
  if (!isAuthenticated && !isPublicPage) {
    return "/sign-in";
  }

  return null;
}

bool _hasSeenOnboarding(Ref<Object?> ref) {
  final hasSeenOnboarding = ref.read(hasSeenOnboardingProvider);
  return hasSeenOnboarding;
}


