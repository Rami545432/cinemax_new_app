class Data {
  String? name;
  String? overview;
  String? homepage;
  String? tagline;

  Data({this.name, this.overview, this.homepage, this.tagline});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json['name'] as String?,
    overview: json['overview'] as String?,
    homepage: json['homepage'] as String?,
    tagline: json['tagline'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'overview': overview,
    'homepage': homepage,
    'tagline': tagline,
  };
}
