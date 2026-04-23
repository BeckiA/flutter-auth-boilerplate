import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? bio;
  final bool isAuthenticated;
  const User({
    this.id,
    this.name,
    this.email,
    this.bio,
    this.password,
    this.isAuthenticated = false,
  });

  @override
  List<Object?> get props => [id, name, email, bio, isAuthenticated, password];
}
