import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? bio;
  final String? photoUrl;
  final bool isAuthenticated;
  final bool isEmailVerified;

  const User({
    this.id,
    this.name,
    this.email,
    this.bio,
    this.photoUrl,
    this.password,
    this.isAuthenticated = false,
    this.isEmailVerified = false,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? bio,
    String? photoUrl,
    bool? isAuthenticated,
    bool? isEmailVerified,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      bio: bio ?? this.bio,
      photoUrl: photoUrl ?? this.photoUrl,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    );
  }

  @override
  List<Object?> get props =>
      [id, name, email, bio, photoUrl, isAuthenticated, password, isEmailVerified];
}
