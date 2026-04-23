import 'dart:async';

import 'package:flutter_auth_boilerplate/core/configs/router-configs/route_names.dart';
import 'package:flutter_auth_boilerplate/presentation/auth/screens/home_screen.dart';
import 'package:flutter_auth_boilerplate/presentation/auth/screens/sign_in_screen.dart';
import 'package:flutter_auth_boilerplate/presentation/auth/screens/sign_up_screen.dart';
import 'package:flutter_auth_boilerplate/presentation/onboarding/screens/onboarding_screen.dart';
import 'package:flutter_auth_boilerplate/presentation/auth/screens/email_verification_screen.dart';
import 'package:flutter_auth_boilerplate/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../presentation/auth/controller/auth/auth_provider.dart';
import '../../../presentation/onboarding/controllers/onboarding/onboarding_provider.dart';

part 'redirection.dart';
part 'refresh_listener.dart';

final routeProvider = Provider((ref) {
  return GoRouter(
      initialLocation: "/splash-screen",
      errorBuilder: (context, state) {
        return const Scaffold(
          body: Center(
            child: Text("Page not found"),
          ),
        );
      },
      redirect: (context, state) {
        final redirect = handleRedirect(context, state, ref);
        return redirect;
      },
      refreshListenable: _refreshListener(ref),
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
            name: RouteNames.splash,
            path: "/splash-screen",
            builder: (context, state) {
              return const SplashScreen();
            }),
        GoRoute(
            name: RouteNames.onboarding,
            path: "/onboarding",
            builder: (context, state) => const OnboardingScreen()),
        GoRoute(
            name: RouteNames.signUp,
            path: "/sign-up",
            builder: (context, state) => const SignUpScreen()),
        GoRoute(
            name: RouteNames.signIn,
            path: "/sign-in",
            builder: (context, state) => const SignInScreen()),
        GoRoute(
            name: RouteNames.home,
            path: "/home",
            builder: (context, state) => const HomeScreen()),
        GoRoute(
            name: RouteNames.emailVerification,
            path: "/email-verification",
            builder: (context, state) => const EmailVerificationScreen()),
        GoRoute(
            path: "/__/auth/action",
            builder: (context, state) {
              final code = state.uri.queryParameters['oobCode'];
              final mode = state.uri.queryParameters['mode'];

              if (code != null && mode == 'verifyEmail') {
                // Return a simple loading screen while we verify
                return Builder(builder: (context) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ref.read(authNotifierProvider.notifier).verifyEmailLink(code);
                  });
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                });
              }
              return const Scaffold(
                body: Center(child: Text("Invalid verification link")),
              );
            }),
      ]);
});

