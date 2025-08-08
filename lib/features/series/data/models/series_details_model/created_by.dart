class CreatedBy {
  int? id;
  String? creditId;
  String? name;
  String? originalName;
  int? gender;
  String? profilePath;

  CreatedBy({
    this.id,
    this.creditId,
    this.name,
    this.originalName,
    this.gender,
    this.profilePath,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json['id'] as int?,
        creditId: json['credit_id'] as String?,
        name: json['name'] as String?,
        originalName: json['original_name'] as String?,
        gender: json['gender'] as int?,
        profilePath: json['profile_path'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'credit_id': creditId,
        'name': name,
        'original_name': originalName,
        'gender': gender,
        'profile_path': profilePath,
      };
}
