import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_auth_boilerplate/core/configs/router-configs/router.dart';
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

    final oobCode = uri.queryParameters['oobCode'];
    final mode = uri.queryParameters['mode'];
    final router = _ref.read(routeProvider);

    // If this URI already carries an auth action payload, handle it directly.
    // Do this BEFORE inspecting nested links to avoid losing oobCode/mode by
    // following continueUrl.
    if (oobCode != null && (mode == 'verifyEmail' || mode == 'resetPassword')) {
      final location = '/__/auth/action?mode=$mode&oobCode=$oobCode';
      debugPrint('DeepLinkService: Redirecting auth mode "$mode" to $location');
      router.go(location);
      return;
    }

    // Firebase wrapper links include the actual action URL in "link".
    // Do not recurse into "continueUrl" because that often points to a plain
    // callback URL without action params.
    final wrappedLink = uri.queryParameters['link'];
    if (wrappedLink != null && wrappedLink.isNotEmpty) {
      final wrappedUri = Uri.tryParse(Uri.decodeFull(wrappedLink));
      if (wrappedUri != null) {
        _handleUri(wrappedUri);
        return;
      }
    }

    if (uri.path.startsWith('/__/auth/')) {
      // Ignore incomplete auth callbacks (e.g. plain /__/auth/action) because
      // they can arrive after a valid deep link and override the correct route.
      if (uri.path == '/__/auth/action' && oobCode == null) {
        debugPrint(
            'DeepLinkService: Ignoring auth/action without mode/oobCode.');
        return;
      }
      if (uri.path == '/__/auth/links' && wrappedLink == null) {
        debugPrint(
            'DeepLinkService: Ignoring auth/links without wrapped link.');
        return;
      }

      final location = '${uri.path}${uri.hasQuery ? '?${uri.query}' : ''}';
      debugPrint('DeepLinkService: Navigating to auth action route: $location');
      router.go(location);
      return;
    }
  }

  void dispose() {
    _linkSubscription?.cancel();
  }
}
