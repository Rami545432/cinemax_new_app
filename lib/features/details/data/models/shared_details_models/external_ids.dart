class ExternalIds {
  String? imdbId;
  dynamic freebaseMid;
  dynamic freebaseId;
  int? tvdbId;
  dynamic tvrageId;
  String? wikidataId;
  String? facebookId;
  String? instagramId;
  String? twitterId;

  ExternalIds({
    this.imdbId,
    this.freebaseMid,
    this.freebaseId,
    this.tvdbId,
    this.tvrageId,
    this.wikidataId,
    this.facebookId,
    this.instagramId,
    this.twitterId,
  });

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
    imdbId: json['imdb_id'] as String?,
    freebaseMid: json['freebase_mid'] as dynamic,
    freebaseId: json['freebase_id'] as dynamic,
    tvdbId: json['tvdb_id'] as int?,
    tvrageId: json['tvrage_id'] as dynamic,
    wikidataId: json['wikidata_id'] as String?,
    facebookId: json['facebook_id'] as String?,
    instagramId: json['instagram_id'] as String?,
    twitterId: json['twitter_id'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'imdb_id': imdbId,
    'freebase_mid': freebaseMid,
    'freebase_id': freebaseId,
    'tvdb_id': tvdbId,
    'tvrage_id': tvrageId,
    'wikidata_id': wikidataId,
    'facebook_id': facebookId,
    'instagram_id': instagramId,
    'twitter_id': twitterId,
  };
}
