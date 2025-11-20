import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? email;
  final String? uid;
  final String? displayName;
  final String? photoUrl;
  final bool isEmailVerified;
  final bool isGuest;
  final DateTime? createdAt;

  const UserEntity({
    required this.email,
    required this.uid,
    required this.displayName,
    required this.photoUrl,
    required this.isEmailVerified,
    required this.isGuest,
    required this.createdAt,
  });
  factory UserEntity.guest() {
    return UserEntity(
      uid: null,
      isGuest: true,
      isEmailVerified: false,
      displayName: null,
      email: null,
      photoUrl: null,
      createdAt: null,
    );
  }

  @override
  List<Object?> get props => [
    email,
    uid,
    displayName,
    photoUrl,
    isEmailVerified,
    isGuest,
    createdAt,
  ];
}
