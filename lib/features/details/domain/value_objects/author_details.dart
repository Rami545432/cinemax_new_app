class AuthorDetails {
  String? name;
  String? username;
  String? avatarPath;
  double? rating;

  AuthorDetails({this.name, this.username, this.avatarPath, this.rating});

  factory AuthorDetails.fromJson(Map<String, dynamic> json) => AuthorDetails(
    name: json['name'] as String?,
    username: json['username'] as String?,
    avatarPath: json['avatar_path'] as String?,
    rating: json['rating'] as double?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'username': username,
    'avatar_path': avatarPath,
    'rating': rating,
  };
}
