// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FavoriteModel _$FavoriteModelFromJson(Map<String, dynamic> json) {
  return _FavoriteModel.fromJson(json);
}

/// @nodoc
mixin _$FavoriteModel {
  // ========== CONTENT IDENTIFICATION ==========
  /// TMDB ID for this specific content
  /// - For movies: Movie ID
  /// - For series: Series ID
  /// - For seasons: Season ID
  /// - For episodes: Episode ID
  @HiveField(1)
  int get specificId => throw _privateConstructorUsedError; // ========== DISPLAY METADATA ==========
  /// Display title
  @HiveField(3)
  String get title => throw _privateConstructorUsedError;
  @HiveField(4)
  String get posterImage => throw _privateConstructorUsedError; // Poster image URL (main thumbnail)
  /// Backdrop image URL (background)
  @HiveField(5)
  String get backdropImage => throw _privateConstructorUsedError; // Genre IDs (for movies and series only)
  /// Empty list for seasons and episodes
  @HiveField(6)
  List<int> get genres => throw _privateConstructorUsedError; // Release/air date (ISO string format: "2024-02-17")
  @HiveField(7)
  String get date => throw _privateConstructorUsedError; // Rating (0.0 - 10.0)
  @HiveField(8)
  double get rating => throw _privateConstructorUsedError; // ========== SERIES/EPISODE SPECIFIC ==========
  /// Season number (0 for movies/series, 1+ for seasons/episodes)
  @HiveField(9)
  int get seasonNumber => throw _privateConstructorUsedError; // Episode number (0 for movies/series/seasons, 1+ for episodes)
  @HiveField(10)
  int get episodeNumber => throw _privateConstructorUsedError; // Parent series TMDB ID (0 for movies/series, series ID for seasons/episodes)
  /// Used for API calls to get full series info
  // ========== SYNC MANAGEMENT ==========
  /// User ID ('guest' for unauthenticated, UID for authenticated)
  /// Used in Hive key generation for multi-user support
  @HiveField(11)
  String get userId => throw _privateConstructorUsedError; // Sync status (false = pending upload, true = synced to cloud)
  /// Only used in Hive, not stored in Firestore
  @HiveField(12)
  bool get isSynced => throw _privateConstructorUsedError; // Last sync timestamp (when last uploaded/downloaded from cloud)
  /// Stored as DateTime in Hive, Timestamp in Firestore
  @HiveField(13)
  DateTime? get lastSyncedAt => throw _privateConstructorUsedError;
  @HiveField(14)
  int get tmbdId => throw _privateConstructorUsedError;

  /// Type of content (movie, series, season, episode)
  @HiveField(2)
  ContentType get contentType => throw _privateConstructorUsedError;

  /// Serializes this FavoriteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FavoriteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavoriteModelCopyWith<FavoriteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteModelCopyWith<$Res> {
  factory $FavoriteModelCopyWith(
    FavoriteModel value,
    $Res Function(FavoriteModel) then,
  ) = _$FavoriteModelCopyWithImpl<$Res, FavoriteModel>;
  @useResult
  $Res call({
    @HiveField(1) int specificId,
    @HiveField(3) String title,
    @HiveField(4) String posterImage,
    @HiveField(5) String backdropImage,
    @HiveField(6) List<int> genres,
    @HiveField(7) String date,
    @HiveField(8) double rating,
    @HiveField(9) int seasonNumber,
    @HiveField(10) int episodeNumber,
    @HiveField(11) String userId,
    @HiveField(12) bool isSynced,
    @HiveField(13) DateTime? lastSyncedAt,
    @HiveField(14) int tmbdId,
    @HiveField(2) ContentType contentType,
  });
}

/// @nodoc
class _$FavoriteModelCopyWithImpl<$Res, $Val extends FavoriteModel>
    implements $FavoriteModelCopyWith<$Res> {
  _$FavoriteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? specificId = null,
    Object? title = null,
    Object? posterImage = null,
    Object? backdropImage = null,
    Object? genres = null,
    Object? date = null,
    Object? rating = null,
    Object? seasonNumber = null,
    Object? episodeNumber = null,
    Object? userId = null,
    Object? isSynced = null,
    Object? lastSyncedAt = freezed,
    Object? tmbdId = null,
    Object? contentType = null,
  }) {
    return _then(
      _value.copyWith(
            specificId: null == specificId
                ? _value.specificId
                : specificId // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            posterImage: null == posterImage
                ? _value.posterImage
                : posterImage // ignore: cast_nullable_to_non_nullable
                      as String,
            backdropImage: null == backdropImage
                ? _value.backdropImage
                : backdropImage // ignore: cast_nullable_to_non_nullable
                      as String,
            genres: null == genres
                ? _value.genres
                : genres // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double,
            seasonNumber: null == seasonNumber
                ? _value.seasonNumber
                : seasonNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            episodeNumber: null == episodeNumber
                ? _value.episodeNumber
                : episodeNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            isSynced: null == isSynced
                ? _value.isSynced
                : isSynced // ignore: cast_nullable_to_non_nullable
                      as bool,
            lastSyncedAt: freezed == lastSyncedAt
                ? _value.lastSyncedAt
                : lastSyncedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            tmbdId: null == tmbdId
                ? _value.tmbdId
                : tmbdId // ignore: cast_nullable_to_non_nullable
                      as int,
            contentType: null == contentType
                ? _value.contentType
                : contentType // ignore: cast_nullable_to_non_nullable
                      as ContentType,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FavoriteModelImplCopyWith<$Res>
    implements $FavoriteModelCopyWith<$Res> {
  factory _$$FavoriteModelImplCopyWith(
    _$FavoriteModelImpl value,
    $Res Function(_$FavoriteModelImpl) then,
  ) = __$$FavoriteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @HiveField(1) int specificId,
    @HiveField(3) String title,
    @HiveField(4) String posterImage,
    @HiveField(5) String backdropImage,
    @HiveField(6) List<int> genres,
    @HiveField(7) String date,
    @HiveField(8) double rating,
    @HiveField(9) int seasonNumber,
    @HiveField(10) int episodeNumber,
    @HiveField(11) String userId,
    @HiveField(12) bool isSynced,
    @HiveField(13) DateTime? lastSyncedAt,
    @HiveField(14) int tmbdId,
    @HiveField(2) ContentType contentType,
  });
}

/// @nodoc
class __$$FavoriteModelImplCopyWithImpl<$Res>
    extends _$FavoriteModelCopyWithImpl<$Res, _$FavoriteModelImpl>
    implements _$$FavoriteModelImplCopyWith<$Res> {
  __$$FavoriteModelImplCopyWithImpl(
    _$FavoriteModelImpl _value,
    $Res Function(_$FavoriteModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavoriteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? specificId = null,
    Object? title = null,
    Object? posterImage = null,
    Object? backdropImage = null,
    Object? genres = null,
    Object? date = null,
    Object? rating = null,
    Object? seasonNumber = null,
    Object? episodeNumber = null,
    Object? userId = null,
    Object? isSynced = null,
    Object? lastSyncedAt = freezed,
    Object? tmbdId = null,
    Object? contentType = null,
  }) {
    return _then(
      _$FavoriteModelImpl(
        specificId: null == specificId
            ? _value.specificId
            : specificId // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        posterImage: null == posterImage
            ? _value.posterImage
            : posterImage // ignore: cast_nullable_to_non_nullable
                  as String,
        backdropImage: null == backdropImage
            ? _value.backdropImage
            : backdropImage // ignore: cast_nullable_to_non_nullable
                  as String,
        genres: null == genres
            ? _value._genres
            : genres // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        seasonNumber: null == seasonNumber
            ? _value.seasonNumber
            : seasonNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        episodeNumber: null == episodeNumber
            ? _value.episodeNumber
            : episodeNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        isSynced: null == isSynced
            ? _value.isSynced
            : isSynced // ignore: cast_nullable_to_non_nullable
                  as bool,
        lastSyncedAt: freezed == lastSyncedAt
            ? _value.lastSyncedAt
            : lastSyncedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        tmbdId: null == tmbdId
            ? _value.tmbdId
            : tmbdId // ignore: cast_nullable_to_non_nullable
                  as int,
        contentType: null == contentType
            ? _value.contentType
            : contentType // ignore: cast_nullable_to_non_nullable
                  as ContentType,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 4)
class _$FavoriteModelImpl extends _FavoriteModel {
  const _$FavoriteModelImpl({
    @HiveField(1) required this.specificId,
    @HiveField(3) required this.title,
    @HiveField(4) required this.posterImage,
    @HiveField(5) required this.backdropImage,
    @HiveField(6) required final List<int> genres,
    @HiveField(7) required this.date,
    @HiveField(8) required this.rating,
    @HiveField(9) this.seasonNumber = 0,
    @HiveField(10) this.episodeNumber = 0,
    @HiveField(11) this.userId = 'guest',
    @HiveField(12) this.isSynced = false,
    @HiveField(13) this.lastSyncedAt,
    @HiveField(14) this.tmbdId = 0,
    @HiveField(2) required this.contentType,
  }) : _genres = genres,
       super._();

  factory _$FavoriteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteModelImplFromJson(json);

  // ========== CONTENT IDENTIFICATION ==========
  /// TMDB ID for this specific content
  /// - For movies: Movie ID
  /// - For series: Series ID
  /// - For seasons: Season ID
  /// - For episodes: Episode ID
  @override
  @HiveField(1)
  final int specificId;
  // ========== DISPLAY METADATA ==========
  /// Display title
  @override
  @HiveField(3)
  final String title;
  @override
  @HiveField(4)
  final String posterImage;
  // Poster image URL (main thumbnail)
  /// Backdrop image URL (background)
  @override
  @HiveField(5)
  final String backdropImage;
  // Genre IDs (for movies and series only)
  /// Empty list for seasons and episodes
  final List<int> _genres;
  // Genre IDs (for movies and series only)
  /// Empty list for seasons and episodes
  @override
  @HiveField(6)
  List<int> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  // Release/air date (ISO string format: "2024-02-17")
  @override
  @HiveField(7)
  final String date;
  // Rating (0.0 - 10.0)
  @override
  @HiveField(8)
  final double rating;
  // ========== SERIES/EPISODE SPECIFIC ==========
  /// Season number (0 for movies/series, 1+ for seasons/episodes)
  @override
  @JsonKey()
  @HiveField(9)
  final int seasonNumber;
  // Episode number (0 for movies/series/seasons, 1+ for episodes)
  @override
  @JsonKey()
  @HiveField(10)
  final int episodeNumber;
  // Parent series TMDB ID (0 for movies/series, series ID for seasons/episodes)
  /// Used for API calls to get full series info
  // ========== SYNC MANAGEMENT ==========
  /// User ID ('guest' for unauthenticated, UID for authenticated)
  /// Used in Hive key generation for multi-user support
  @override
  @JsonKey()
  @HiveField(11)
  final String userId;
  // Sync status (false = pending upload, true = synced to cloud)
  /// Only used in Hive, not stored in Firestore
  @override
  @JsonKey()
  @HiveField(12)
  final bool isSynced;
  // Last sync timestamp (when last uploaded/downloaded from cloud)
  /// Stored as DateTime in Hive, Timestamp in Firestore
  @override
  @HiveField(13)
  final DateTime? lastSyncedAt;
  @override
  @JsonKey()
  @HiveField(14)
  final int tmbdId;

  /// Type of content (movie, series, season, episode)
  @override
  @HiveField(2)
  final ContentType contentType;

  @override
  String toString() {
    return 'FavoriteModel(specificId: $specificId, title: $title, posterImage: $posterImage, backdropImage: $backdropImage, genres: $genres, date: $date, rating: $rating, seasonNumber: $seasonNumber, episodeNumber: $episodeNumber, userId: $userId, isSynced: $isSynced, lastSyncedAt: $lastSyncedAt, tmbdId: $tmbdId, contentType: $contentType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteModelImpl &&
            (identical(other.specificId, specificId) ||
                other.specificId == specificId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.posterImage, posterImage) ||
                other.posterImage == posterImage) &&
            (identical(other.backdropImage, backdropImage) ||
                other.backdropImage == backdropImage) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.seasonNumber, seasonNumber) ||
                other.seasonNumber == seasonNumber) &&
            (identical(other.episodeNumber, episodeNumber) ||
                other.episodeNumber == episodeNumber) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced) &&
            (identical(other.lastSyncedAt, lastSyncedAt) ||
                other.lastSyncedAt == lastSyncedAt) &&
            (identical(other.tmbdId, tmbdId) || other.tmbdId == tmbdId) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    specificId,
    title,
    posterImage,
    backdropImage,
    const DeepCollectionEquality().hash(_genres),
    date,
    rating,
    seasonNumber,
    episodeNumber,
    userId,
    isSynced,
    lastSyncedAt,
    tmbdId,
    contentType,
  );

  /// Create a copy of FavoriteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteModelImplCopyWith<_$FavoriteModelImpl> get copyWith =>
      __$$FavoriteModelImplCopyWithImpl<_$FavoriteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteModelImplToJson(this);
  }
}

abstract class _FavoriteModel extends FavoriteModel {
  const factory _FavoriteModel({
    @HiveField(1) required final int specificId,
    @HiveField(3) required final String title,
    @HiveField(4) required final String posterImage,
    @HiveField(5) required final String backdropImage,
    @HiveField(6) required final List<int> genres,
    @HiveField(7) required final String date,
    @HiveField(8) required final double rating,
    @HiveField(9) final int seasonNumber,
    @HiveField(10) final int episodeNumber,
    @HiveField(11) final String userId,
    @HiveField(12) final bool isSynced,
    @HiveField(13) final DateTime? lastSyncedAt,
    @HiveField(14) final int tmbdId,
    @HiveField(2) required final ContentType contentType,
  }) = _$FavoriteModelImpl;
  const _FavoriteModel._() : super._();

  factory _FavoriteModel.fromJson(Map<String, dynamic> json) =
      _$FavoriteModelImpl.fromJson;

  @override // ========== CONTENT IDENTIFICATION ==========
  /// TMDB ID for this specific content
  /// - For movies: Movie ID
  /// - For series: Series ID
  /// - For seasons: Season ID
  /// - For episodes: Episode ID
  @HiveField(1)
  int get specificId;
  @override // ========== DISPLAY METADATA ==========
  /// Display title
  @HiveField(3)
  String get title;
  @override
  @HiveField(4)
  String get posterImage;
  @override // Poster image URL (main thumbnail)
  /// Backdrop image URL (background)
  @HiveField(5)
  String get backdropImage;
  @override // Genre IDs (for movies and series only)
  /// Empty list for seasons and episodes
  @HiveField(6)
  List<int> get genres;
  @override // Release/air date (ISO string format: "2024-02-17")
  @HiveField(7)
  String get date;
  @override // Rating (0.0 - 10.0)
  @HiveField(8)
  double get rating;
  @override // ========== SERIES/EPISODE SPECIFIC ==========
  /// Season number (0 for movies/series, 1+ for seasons/episodes)
  @HiveField(9)
  int get seasonNumber;
  @override // Episode number (0 for movies/series/seasons, 1+ for episodes)
  @HiveField(10)
  int get episodeNumber;
  @override // Parent series TMDB ID (0 for movies/series, series ID for seasons/episodes)
  /// Used for API calls to get full series info
  // ========== SYNC MANAGEMENT ==========
  /// User ID ('guest' for unauthenticated, UID for authenticated)
  /// Used in Hive key generation for multi-user support
  @HiveField(11)
  String get userId;
  @override // Sync status (false = pending upload, true = synced to cloud)
  /// Only used in Hive, not stored in Firestore
  @HiveField(12)
  bool get isSynced;
  @override // Last sync timestamp (when last uploaded/downloaded from cloud)
  /// Stored as DateTime in Hive, Timestamp in Firestore
  @HiveField(13)
  DateTime? get lastSyncedAt;
  @override
  @HiveField(14)
  int get tmbdId;
  @override
  /// Type of content (movie, series, season, episode)
  @HiveField(2)
  ContentType get contentType;

  /// Create a copy of FavoriteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoriteModelImplCopyWith<_$FavoriteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
