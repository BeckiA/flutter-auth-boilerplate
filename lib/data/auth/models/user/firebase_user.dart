import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_auth_boilerplate/domain/auth/entities/user.dart';

class FirebaseUser extends User {
  const FirebaseUser({
    required String id,
    required String name,
    required String email,
    String? password,
    String? bio,
    bool isAuthenticated = false,
  }) : super(
          id: id,
          name: name,
          email: email,
          password: password,
          bio: bio,
          isAuthenticated: isAuthenticated,
        );

  factory FirebaseUser.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    return FirebaseUser(
      id: data?['id'] as String? ?? '',
      name: data?['name'] as String? ?? '',
      email: data?['email'] as String? ?? '',
      bio: data?['bio'] as String?,
    );
  }

  Map<String, dynamic> toDoc() {
    return {
      'id': id,
      'name': name,
      'email': email,
      if (bio != null) 'bio': bio,
    };
  }

  factory FirebaseUser.fromEntity(User user) {
    return FirebaseUser(
      id: user.id ?? "",
      name: user.name ?? "",
      email: user.email ?? "",
      password: user.password,
      bio: user.bio,
      isAuthenticated: user.isAuthenticated,
    );
  }
}
