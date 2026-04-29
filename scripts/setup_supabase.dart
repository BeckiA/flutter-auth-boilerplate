import 'dart:io';

// This script can be run to set the Supabase config in Secure Storage.
// Note: This requires the app to be running or a specific environment.
// Since Secure Storage is platform-specific, it's better to do this within the app or via a debug menu.

void main() async {
  print('Enter Supabase Project URL:');
  final url = stdin.readLineSync();
  print('Enter Supabase Anon Key:');
  final anonKey = stdin.readLineSync();

  if (url != null && anonKey != null) {
    // Note: In a real scenario, you'd use a tool that can interact with the device's secure storage.
    // For now, this is a placeholder to show how it would be done.
    print('To save these keys, use the following code in your app:');
    print('await SecureStorageService().saveSupabaseConfig(url: "$url", anonKey: "$anonKey");');
  }
}
