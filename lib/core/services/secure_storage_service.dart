import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final secureStorageServiceProvider = Provider<SecureStorageService>((ref) {
  return const SecureStorageService();
});

class SecureStorageService {
  final FlutterSecureStorage _storage;

  const SecureStorageService() : _storage = const FlutterSecureStorage();

  static const String _supabaseUrlKey = 'supabase_url';
  static const String _supabaseAnonKey = 'supabase_anon_key';

  Future<void> saveSupabaseConfig(
      {required String url, required String anonKey}) async {
    await _storage.write(key: _supabaseUrlKey, value: url);
    await _storage.write(key: _supabaseAnonKey, value: anonKey);
  }

  Future<Map<String, String?>> getSupabaseConfig() async {
    final url = await _storage.read(key: _supabaseUrlKey);
    final anonKey = await _storage.read(key: _supabaseAnonKey);
    return {
      'url': url,
      'anonKey': anonKey,
    };
  }

  Future<void> clearSupabaseConfig() async {
    await _storage.delete(key: _supabaseUrlKey);
    await _storage.delete(key: _supabaseAnonKey);
  }
}
