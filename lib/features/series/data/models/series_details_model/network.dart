class Network {
  num? id;
  String? logoPath;
  String? name;
  String? originCountry;

  Network({this.id, this.logoPath, this.name, this.originCountry});

  factory Network.fromJson(Map<String, dynamic> json) => Network(
        id: json['id'] as num?,
        logoPath: json['logo_path'] as String?,
        name: json['name'] as String?,
        originCountry: json['origin_country'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'logo_path': logoPath,
        'name': name,
        'origin_country': originCountry,
      };
}
