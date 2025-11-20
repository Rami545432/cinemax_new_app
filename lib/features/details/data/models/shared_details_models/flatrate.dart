class Flatrate {
  String? logoPath;
  int? providerId;
  String? providerName;
  int? displayPriority;

  Flatrate({
    this.logoPath,
    this.providerId,
    this.providerName,
    this.displayPriority,
  });

  factory Flatrate.fromJson(Map<String, dynamic> json) => Flatrate(
    logoPath: json['logo_path'] as String?,
    providerId: json['provider_id'] as int?,
    providerName: json['provider_name'] as String?,
    displayPriority: json['display_priority'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'logo_path': logoPath,
    'provider_id': providerId,
    'provider_name': providerName,
    'display_priority': displayPriority,
  };
}
