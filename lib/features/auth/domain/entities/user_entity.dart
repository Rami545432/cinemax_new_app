class UserEntity {
  final String? email;
  final String id;
  final bool? emailVerify;
  UserEntity({this.emailVerify, this.email, required this.id});
}
