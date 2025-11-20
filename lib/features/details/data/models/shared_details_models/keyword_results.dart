class KeywordResults {
  int? id;
  String? name;
  KeywordResults({this.id, this.name});

  factory KeywordResults.fromJson(Map<String, dynamic> json) =>
      KeywordResults(id: json['id'] as int?, name: json['name'] as String?);

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
