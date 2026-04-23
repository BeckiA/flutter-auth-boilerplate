import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFirestoreExtension on FirebaseFirestore {
  static const String _users = 'users';
  DocumentReference<Map<String, dynamic>> userDocument(String? userId) {
    if (userId == null) throw Exception('userId is null');
    return collection(_users).doc(userId);
  }
}
