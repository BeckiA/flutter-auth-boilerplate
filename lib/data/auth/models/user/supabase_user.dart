import 'package:flutter_auth_boilerplate/domain/auth/entities/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

class SupabaseUser extends User {
  const SupabaseUser({
    required super.id,
    required super.name,
    required super.email,
    super.password,
    super.bio,
    super.photoUrl,
    super.isAuthenticated = false,
    super.isEmailVerified = false,
  });

  factory SupabaseUser.fromSupabase(sb.User sbUser, Map<String, dynamic>? profileData) {
    return SupabaseUser(
      id: sbUser.id,
      name: profileData?['name'] as String? ?? sbUser.userMetadata?['name'] as String? ?? '',
      email: sbUser.email ?? '',
      bio: profileData?['bio'] as String? ?? sbUser.userMetadata?['bio'] as String?,
      photoUrl: profileData?['photo_url'] as String? ?? sbUser.userMetadata?['avatar_url'] as String?,
      isAuthenticated: true,
      isEmailVerified: sbUser.emailConfirmedAt != null,
    );
  }

  Map<String, dynamic> toProfileData() {
    return {
      'id': id,
      'name': name,
      'email': email,
      if (bio != null) 'bio': bio,
      if (photoUrl != null) 'photo_url': photoUrl,
    };
  }

  factory SupabaseUser.fromEntity(User user) {
    return SupabaseUser(
      id: user.id ?? '',
      name: user.name ?? '',
      email: user.email ?? '',
      password: user.password,
      bio: user.bio,
      photoUrl: user.photoUrl,
      isAuthenticated: user.isAuthenticated,
      isEmailVerified: user.isEmailVerified,
    );
  }

  @override
  SupabaseUser copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? bio,
    String? photoUrl,
    bool? isAuthenticated,
    bool? isEmailVerified,
  }) {
    return SupabaseUser(
      id: id ?? this.id ?? '',
      name: name ?? this.name ?? '',
      email: email ?? this.email ?? '',
      password: password ?? this.password,
      bio: bio ?? this.bio,
      photoUrl: photoUrl ?? this.photoUrl,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    );
  }
}
