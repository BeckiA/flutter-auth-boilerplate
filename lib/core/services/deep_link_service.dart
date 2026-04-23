import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_auth_boilerplate/presentation/auth/controller/auth/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deepLinkServiceProvider = Provider<DeepLinkService>((ref) {
  final service = DeepLinkService(ref);
  service.init();
  return service;
});

class DeepLinkService {
  final Ref _ref;
  late final AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  DeepLinkService(this._ref) {
    _appLinks = AppLinks();
  }

  Future<void> init() async {
    // Check initial link if the app was opened via a link
    try {
      final initialUri = await _appLinks.getInitialLink();
      if (initialUri != null) {
        _handleUri(initialUri);
      }
    } catch (e) {
      debugPrint('DeepLinkService: Error getting initial link: $e');
    }

    // Subscribe to link changes while the app is running
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (uri) {
        _handleUri(uri);
      },
      onError: (err) {
        debugPrint('DeepLinkService: Error on link stream: $err');
      },
    );
  }

  void _handleUri(Uri uri) {
    debugPrint('DeepLinkService: Received link: $uri');
    
    // Firebase Auth links usually contain oobCode in query parameters
    final oobCode = uri.queryParameters['oobCode'];
    if (oobCode != null) {
      debugPrint('DeepLinkService: Found oobCode, verifying email link...');
      _ref.read(authNotifierProvider.notifier).verifyEmailLink(oobCode);
    }
  }

  void dispose() {
    _linkSubscription?.cancel();
  }
}
