import 'package:cinemax_app_new/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class UserModel {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoUrl;
  final bool isGuest;
  final bool isEmailVerified;
  final DateTime? createdAt;
  const UserModel({
    required this.uid,
    this.email,
    this.displayName,
    this.photoUrl,
    required this.isGuest,
    required this.isEmailVerified,
    this.createdAt,
  });

  factory UserModel.fromFirebaseUser(firebase_auth.User user) => UserModel(
    uid: user.uid,
    email: user.email,
    displayName: user.displayName,
    photoUrl: user.photoURL,
    isGuest: user.isAnonymous,
    isEmailVerified: user.emailVerified,
    createdAt: user.metadata.creationTime,
  );

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email': email,
    'displayName': displayName,
    'photoUrl': photoUrl,
    'isGuest': isGuest,
    'isEmailVerified': isEmailVerified,
    'createdAt': createdAt?.toIso8601String(),
  };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    uid: json['uid'] as String,
    email: json['email'] as String?,
    displayName: json['displayName'] as String?,
    photoUrl: json['photoUrl'] as String?,
    isGuest: json['isGuest'] as bool,
    isEmailVerified: json['isEmailVerified'] as bool,
    createdAt: json['createdAt'] != null
        ? DateTime.parse(json['createdAt'] as String)
        : null,
  );

  UserEntity toEntity() => UserEntity(
    uid: uid,
    email: email,
    displayName: displayName,
    photoUrl: photoUrl,
    isGuest: isGuest,
    isEmailVerified: isEmailVerified,
    createdAt: createdAt,
  );
}
