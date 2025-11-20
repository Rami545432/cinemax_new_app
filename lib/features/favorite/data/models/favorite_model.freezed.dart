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
  @HiveField(1)
  int get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String get title => throw _privateConstructorUsedError;
  @HiveField(3)
  String get imageUrl => throw _privateConstructorUsedError;
  @HiveField(4)
  List<String> get gener => throw _privateConstructorUsedError;
  @HiveField(5)
  ContentType get contentType => throw _privateConstructorUsedError;
  @HiveField(6)
  String get date => throw _privateConstructorUsedError;
  @HiveField(7)
  String get userId => throw _privateConstructorUsedError;
  @HiveField(8)
  bool get isSynced => throw _privateConstructorUsedError;
  @HiveField(9)
  int get seasonNumber => throw _privateConstructorUsedError;
  @HiveField(10)
  int get specificId => throw _privateConstructorUsedError;
  @HiveField(11)
  String get seasonPosterUrl => throw _privateConstructorUsedError;
  @HiveField(12)
  String get backGroundImage => throw _privateConstructorUsedError;
  @HiveField(13)
  int get episodeNumber => throw _privateConstructorUsedError;

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
    @HiveField(1) int id,
    @HiveField(2) String title,
    @HiveField(3) String imageUrl,
    @HiveField(4) List<String> gener,
    @HiveField(5) ContentType contentType,
    @HiveField(6) String date,
    @HiveField(7) String userId,
    @HiveField(8) bool isSynced,
    @HiveField(9) int seasonNumber,
    @HiveField(10) int specificId,
    @HiveField(11) String seasonPosterUrl,
    @HiveField(12) String backGroundImage,
    @HiveField(13) int episodeNumber,
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
    Object? id = null,
    Object? title = null,
    Object? imageUrl = null,
    Object? gener = null,
    Object? contentType = null,
    Object? date = null,
    Object? userId = null,
    Object? isSynced = null,
    Object? seasonNumber = null,
    Object? specificId = null,
    Object? seasonPosterUrl = null,
    Object? backGroundImage = null,
    Object? episodeNumber = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            gener: null == gener
                ? _value.gener
                : gener // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            contentType: null == contentType
                ? _value.contentType
                : contentType // ignore: cast_nullable_to_non_nullable
                      as ContentType,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            isSynced: null == isSynced
                ? _value.isSynced
                : isSynced // ignore: cast_nullable_to_non_nullable
                      as bool,
            seasonNumber: seasonNumber == null
                ? _value.seasonNumber
                : seasonNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            specificId: specificId == null
                ? _value.specificId
                : specificId // ignore: cast_nullable_to_non_nullable
                      as int,
            seasonPosterUrl: seasonPosterUrl == null
                ? _value.seasonPosterUrl
                : seasonPosterUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            backGroundImage: backGroundImage == null
                ? _value.backGroundImage
                : backGroundImage // ignore: cast_nullable_to_non_nullable
                      as String,
            episodeNumber: episodeNumber == null
                ? _value.episodeNumber
                : episodeNumber // ignore: cast_nullable_to_non_nullable
                      as int,
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
    @HiveField(1) int id,
    @HiveField(2) String title,
    @HiveField(3) String imageUrl,
    @HiveField(4) List<String> gener,
    @HiveField(5) ContentType contentType,
    @HiveField(6) String date,
    @HiveField(7) String userId,
    @HiveField(8) bool isSynced,
    @HiveField(9) int seasonNumber,
    @HiveField(10) int specificId,
    @HiveField(11) String seasonPosterUrl,
    @HiveField(12) String backGroundImage,
    @HiveField(13) int episodeNumber,
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
    Object? id = null,
    Object? title = null,
    Object? imageUrl = null,
    Object? gener = null,
    Object? contentType = null,
    Object? date = null,
    Object? userId = null,
    Object? isSynced = null,
    Object? seasonNumber = null,
    Object? specificId = null,
    Object? seasonPosterUrl = null,
    Object? backGroundImage = null,
    Object? episodeNumber = null,
  }) {
    return _then(
      _$FavoriteModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        gener: null == gener
            ? _value._gener
            : gener // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        contentType: null == contentType
            ? _value.contentType
            : contentType // ignore: cast_nullable_to_non_nullable
                  as ContentType,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        isSynced: null == isSynced
            ? _value.isSynced
            : isSynced // ignore: cast_nullable_to_non_nullable
                  as bool,
        seasonNumber: seasonNumber == null
            ? _value.seasonNumber
            : seasonNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        specificId: specificId == null
            ? _value.specificId
            : specificId // ignore: cast_nullable_to_non_nullable
                  as int,
        seasonPosterUrl: seasonPosterUrl == null
            ? _value.seasonPosterUrl
            : seasonPosterUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        backGroundImage: backGroundImage == null
            ? _value.backGroundImage
            : backGroundImage // ignore: cast_nullable_to_non_nullable
                  as String,
        episodeNumber: episodeNumber == null
            ? _value.episodeNumber
            : episodeNumber // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
@HiveField(0)
class _$FavoriteModelImpl implements _FavoriteModel {
  const _$FavoriteModelImpl({
    @HiveField(1) required this.id,
    @HiveField(2) required this.title,
    @HiveField(3) required this.imageUrl,
    @HiveField(4) required final List<String> gener,
    @HiveField(5) required this.contentType,
    @HiveField(6) required this.date,
    @HiveField(7) this.userId = 'guest',
    @HiveField(8) this.isSynced = false,
    @HiveField(9) this.seasonNumber = 0,
    @HiveField(10) this.specificId = 0,
    @HiveField(11) this.seasonPosterUrl = '',
    @HiveField(12) this.backGroundImage = '',
    @HiveField(13) this.episodeNumber = 0,
  }) : _gener = gener;

  factory _$FavoriteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteModelImplFromJson(json);

  @override
  @HiveField(1)
  final int id;
  @override
  @HiveField(2)
  final String title;
  @override
  @HiveField(3)
  final String imageUrl;
  final List<String> _gener;
  @override
  @HiveField(4)
  List<String> get gener {
    if (_gener is EqualUnmodifiableListView) return _gener;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gener);
  }

  @override
  @HiveField(5)
  final ContentType contentType;
  @override
  @HiveField(6)
  final String date;
  @override
  @JsonKey()
  @HiveField(7)
  final String userId;
  @override
  @JsonKey()
  @HiveField(8)
  final bool isSynced;
  @override
  @HiveField(9)
  final int seasonNumber;
  @override
  @HiveField(10)
  final int specificId;
  @override
  @HiveField(11)
  final String seasonPosterUrl;
  @override
  @HiveField(12)
  final String backGroundImage;
  @override
  @HiveField(13)
  final int episodeNumber;

  @override
  String toString() {
    return 'FavoriteModel(id: $id, title: $title, imageUrl: $imageUrl, gener: $gener, contentType: $contentType, date: $date, userId: $userId, isSynced: $isSynced, seasonNumber: $seasonNumber, specificId: $specificId, seasonPosterUrl: $seasonPosterUrl, backGroundImage: $backGroundImage, episodeNumber: $episodeNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._gener, _gener) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced) &&
            (identical(other.seasonNumber, seasonNumber) ||
                other.seasonNumber == seasonNumber) &&
            (identical(other.specificId, specificId) ||
                other.specificId == specificId) &&
            (identical(other.seasonPosterUrl, seasonPosterUrl) ||
                other.seasonPosterUrl == seasonPosterUrl) &&
            (identical(other.backGroundImage, backGroundImage) ||
                other.backGroundImage == backGroundImage) &&
            (identical(other.episodeNumber, episodeNumber) ||
                other.episodeNumber == episodeNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    imageUrl,
    const DeepCollectionEquality().hash(_gener),
    contentType,
    date,
    userId,
    isSynced,
    seasonNumber,
    specificId,
    seasonPosterUrl,
    backGroundImage,
    episodeNumber,
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

abstract class _FavoriteModel implements FavoriteModel {
  const factory _FavoriteModel({
    @HiveField(1) required final int id,
    @HiveField(2) required final String title,
    @HiveField(3) required final String imageUrl,
    @HiveField(4) required final List<String> gener,
    @HiveField(5) required final ContentType contentType,
    @HiveField(6) required final String date,
    @HiveField(7) final String userId,
    @HiveField(8) final bool isSynced,
    @HiveField(9) final int seasonNumber,
    @HiveField(10) final int specificId,
    @HiveField(11) final String seasonPosterUrl,
    @HiveField(12) final String backGroundImage,
    @HiveField(13) final int episodeNumber,
  }) = _$FavoriteModelImpl;

  factory _FavoriteModel.fromJson(Map<String, dynamic> json) =
      _$FavoriteModelImpl.fromJson;

  @override
  @HiveField(1)
  int get id;
  @override
  @HiveField(2)
  String get title;
  @override
  @HiveField(3)
  String get imageUrl;
  @override
  @HiveField(4)
  List<String> get gener;
  @override
  @HiveField(5)
  ContentType get contentType;
  @override
  @HiveField(6)
  String get date;
  @override
  @HiveField(7)
  String get userId;
  @override
  @HiveField(8)
  bool get isSynced;
  @override
  @HiveField(9)
  int get seasonNumber;
  @override
  @HiveField(10)
  int get specificId;
  @override
  @HiveField(11)
  String get seasonPosterUrl;
  @override
  @HiveField(12)
  String get backGroundImage;
  @override
  @HiveField(13)
  int get episodeNumber;

  /// Create a copy of FavoriteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoriteModelImplCopyWith<_$FavoriteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
