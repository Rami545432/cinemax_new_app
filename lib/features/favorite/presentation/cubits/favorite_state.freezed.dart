// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FavoriteState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      Map<String, bool> favoriteStatuses,
      String currentUserId,
      int unsyncedCount,
      DateTime? lastSyncTime,
      bool isSyncing,
    )
    loaded,
    required TResult Function(String message, String currentUserId) syncing,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      Map<String, bool> favoriteStatuses,
      String currentUserId,
      int unsyncedCount,
      DateTime? lastSyncTime,
      bool isSyncing,
    )?
    loaded,
    TResult? Function(String message, String currentUserId)? syncing,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      Map<String, bool> favoriteStatuses,
      String currentUserId,
      int unsyncedCount,
      DateTime? lastSyncTime,
      bool isSyncing,
    )?
    loaded,
    TResult Function(String message, String currentUserId)? syncing,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteInitial value) initial,
    required TResult Function(FavoriteLoading value) loading,
    required TResult Function(FavoriteLoaded value) loaded,
    required TResult Function(FavoriteSyncing value) syncing,
    required TResult Function(FavoriteError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteInitial value)? initial,
    TResult? Function(FavoriteLoading value)? loading,
    TResult? Function(FavoriteLoaded value)? loaded,
    TResult? Function(FavoriteSyncing value)? syncing,
    TResult? Function(FavoriteError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteInitial value)? initial,
    TResult Function(FavoriteLoading value)? loading,
    TResult Function(FavoriteLoaded value)? loaded,
    TResult Function(FavoriteSyncing value)? syncing,
    TResult Function(FavoriteError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteStateCopyWith<$Res> {
  factory $FavoriteStateCopyWith(
    FavoriteState value,
    $Res Function(FavoriteState) then,
  ) = _$FavoriteStateCopyWithImpl<$Res, FavoriteState>;
}

/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res, $Val extends FavoriteState>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FavoriteInitialImplCopyWith<$Res> {
  factory _$$FavoriteInitialImplCopyWith(
    _$FavoriteInitialImpl value,
    $Res Function(_$FavoriteInitialImpl) then,
  ) = __$$FavoriteInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoriteInitialImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$FavoriteInitialImpl>
    implements _$$FavoriteInitialImplCopyWith<$Res> {
  __$$FavoriteInitialImplCopyWithImpl(
    _$FavoriteInitialImpl _value,
    $Res Function(_$FavoriteInitialImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$FavoriteInitialImpl implements FavoriteInitial {
  const _$FavoriteInitialImpl();

  @override
  String toString() {
    return 'FavoriteState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FavoriteInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      Map<String, bool> favoriteStatuses,
      String currentUserId,
      int unsyncedCount,
      DateTime? lastSyncTime,
      bool isSyncing,
    )
    loaded,
    required TResult Function(String message, String currentUserId) syncing,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      Map<String, bool> favoriteStatuses,
      String currentUserId,
      int unsyncedCount,
      DateTime? lastSyncTime,
      bool isSyncing,
    )?
    loaded,
    TResult? Function(String message, String currentUserId)? syncing,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      Map<String, bool> favoriteStatuses,
      String currentUserId,
      int unsyncedCount,
      DateTime? lastSyncTime,
      bool isSyncing,
    )?
    loaded,
    TResult Function(String message, String currentUserId)? syncing,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteInitial value) initial,
    required TResult Function(FavoriteLoading value) loading,
    required TResult Function(FavoriteLoaded value) loaded,
    required TResult Function(FavoriteSyncing value) syncing,
    required TResult Function(FavoriteError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteInitial value)? initial,
    TResult? Function(FavoriteLoading value)? loading,
    TResult? Function(FavoriteLoaded value)? loaded,
    TResult? Function(FavoriteSyncing value)? syncing,
    TResult? Function(FavoriteError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteInitial value)? initial,
    TResult Function(FavoriteLoading value)? loading,
    TResult Function(FavoriteLoaded value)? loaded,
    TResult Function(FavoriteSyncing value)? syncing,
    TResult Function(FavoriteError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FavoriteInitial implements FavoriteState {
  const factory FavoriteInitial() = _$FavoriteInitialImpl;
}

/// @nodoc
abstract class _$$FavoriteLoadingImplCopyWith<$Res> {
  factory _$$FavoriteLoadingImplCopyWith(
    _$FavoriteLoadingImpl value,
    $Res Function(_$FavoriteLoadingImpl) then,
  ) = __$$FavoriteLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoriteLoadingImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$FavoriteLoadingImpl>
    implements _$$FavoriteLoadingImplCopyWith<$Res> {
  __$$FavoriteLoadingImplCopyWithImpl(
    _$FavoriteLoadingImpl _value,
    $Res Function(_$FavoriteLoadingImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$FavoriteLoadingImpl implements FavoriteLoading {
  const _$FavoriteLoadingImpl();

  @override
  String toString() {
    return 'FavoriteState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FavoriteLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      Map<String, bool> favoriteStatuses,
      String currentUserId,
      int unsyncedCount,
      DateTime? lastSyncTime,
      bool isSyncing,
    )
    loaded,
    required TResult Function(String message, String currentUserId) syncing,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      Map<String, bool> favoriteStatuses,
      String currentUserId,
      int unsyncedCount,
      DateTime? lastSyncTime,
      bool isSyncing,
    )?
    loaded,
    TResult? Function(String message, String currentUserId)? syncing,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      Map<String, bool> favoriteStatuses,
      String currentUserId,
      int unsyncedCount,
      DateTime? lastSyncTime,
      bool isSyncing,
    )?
    loaded,
    TResult Function(String message, String currentUserId)? syncing,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteInitial value) initial,
    required TResult Function(FavoriteLoading value) loading,
    required TResult Function(FavoriteLoaded value) loaded,
    required TResult Function(FavoriteSyncing value) syncing,
    required TResult Function(FavoriteError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteInitial value)? initial,
    TResult? Function(FavoriteLoading value)? loading,
    TResult? Function(FavoriteLoaded value)? loaded,
    TResult? Function(FavoriteSyncing value)? syncing,
    TResult? Function(FavoriteError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteInitial value)? initial,
    TResult Function(FavoriteLoading value)? loading,
    TResult Function(FavoriteLoaded value)? loaded,
    TResult Function(FavoriteSyncing value)? syncing,
    TResult Function(FavoriteError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FavoriteLoading implements FavoriteState {
  const factory FavoriteLoading() = _$FavoriteLoadingImpl;
}

/// @nodoc
abstract class _$$FavoriteLoadedImplCopyWith<$Res> {
  factory _$$FavoriteLoadedImplCopyWith(
    _$FavoriteLoadedImpl value,
    $Res Function(_$FavoriteLoadedImpl) then,
  ) = __$$FavoriteLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    Map<String, bool> favoriteStatuses,
    String currentUserId,
    int unsyncedCount,
    DateTime? lastSyncTime,
    bool isSyncing,
  });
}

/// @nodoc
class __$$FavoriteLoadedImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$FavoriteLoadedImpl>
    implements _$$FavoriteLoadedImplCopyWith<$Res> {
  __$$FavoriteLoadedImplCopyWithImpl(
    _$FavoriteLoadedImpl _value,
    $Res Function(_$FavoriteLoadedImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteStatuses = null,
    Object? currentUserId = null,
    Object? unsyncedCount = null,
    Object? lastSyncTime = freezed,
    Object? isSyncing = null,
  }) {
    return _then(
      _$FavoriteLoadedImpl(
        favoriteStatuses: null == favoriteStatuses
            ? _value._favoriteStatuses
            : favoriteStatuses // ignore: cast_nullable_to_non_nullable
                  as Map<String, bool>,
        currentUserId: null == currentUserId
            ? _value.currentUserId
            : currentUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        unsyncedCount: null == unsyncedCount
            ? _value.unsyncedCount
            : unsyncedCount // ignore: cast_nullable_to_non_nullable
                  as int,
        lastSyncTime: freezed == lastSyncTime
            ? _value.lastSyncTime
            : lastSyncTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isSyncing: null == isSyncing
            ? _value.isSyncing
            : isSyncing // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$FavoriteLoadedImpl implements FavoriteLoaded {
  const _$FavoriteLoadedImpl({
    required final Map<String, bool> favoriteStatuses,
    required this.currentUserId,
    this.unsyncedCount = 0,
    this.lastSyncTime,
    this.isSyncing = false,
  }) : _favoriteStatuses = favoriteStatuses;

  /// Map of "contentType_id" → isFavorite
  /// Used for fast isFavorite checks in UI
  /// Example: {"movie_550": true, "series_1399": true}
  final Map<String, bool> _favoriteStatuses;

  /// Map of "contentType_id" → isFavorite
  /// Used for fast isFavorite checks in UI
  /// Example: {"movie_550": true, "series_1399": true}
  @override
  Map<String, bool> get favoriteStatuses {
    if (_favoriteStatuses is EqualUnmodifiableMapView) return _favoriteStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_favoriteStatuses);
  }

  /// Current user ID ('guest' or actual UID)
  @override
  final String currentUserId;

  /// Number of favorites not yet synced to cloud
  /// Used for badge: "3 pending"
  @override
  @JsonKey()
  final int unsyncedCount;

  /// Last time we synced with cloud
  /// Used to show: "Synced 5 minutes ago"
  @override
  final DateTime? lastSyncTime;

  /// Is currently syncing from cloud
  /// Used to show sync indicator
  @override
  @JsonKey()
  final bool isSyncing;

  @override
  String toString() {
    return 'FavoriteState.loaded(favoriteStatuses: $favoriteStatuses, currentUserId: $currentUserId, unsyncedCount: $unsyncedCount, lastSyncTime: $lastSyncTime, isSyncing: $isSyncing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteLoadedImpl &&
            const DeepCollectionEquality().equals(
              other._favoriteStatuses,
              _favoriteStatuses,
            ) &&
            (identical(other.currentUserId, currentUserId) ||
                other.currentUserId == currentUserId) &&
            (identical(other.unsyncedCount, unsyncedCount) ||
                other.unsyncedCount == unsyncedCount) &&
            (identical(other.lastSyncTime, lastSyncTime) ||
                other.lastSyncTime == lastSyncTime) &&
            (identical(other.isSyncing, isSyncing) ||
                other.isSyncing == isSyncing));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_favoriteStatuses),
    currentUserId,
    unsyncedCount,
    lastSyncTime,
    isSyncing,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteLoadedImplCopyWith<_$FavoriteLoadedImpl> get copyWith =>
      __$$FavoriteLoadedImplCopyWithImpl<_$FavoriteLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      Map<String, bool> favoriteStatuses,
      String currentUserId,
      int unsyncedCount,
      DateTime? lastSyncTime,
      bool isSyncing,
    )
    loaded,
    required TResult Function(String message, String currentUserId) syncing,
    required TResult Function(String message) error,
  }) {
    return loaded(
      favoriteStatuses,
      currentUserId,
      unsyncedCount,
      lastSyncTime,
      isSyncing,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      Map<String, bool> favoriteStatuses,
      String currentUserId,
      int unsyncedCount,
      DateTime? lastSyncTime,
      bool isSyncing,
    )?
    loaded,
    TResult? Function(String message, String currentUserId)? syncing,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(
      favoriteStatuses,
      currentUserId,
      unsyncedCount,
      lastSyncTime,
      isSyncing,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      Map<String, bool> favoriteStatuses,
      String currentUserId,
      int unsyncedCount,
      DateTime? lastSyncTime,
      bool isSyncing,
    )?
    loaded,
    TResult Function(String message, String currentUserId)? syncing,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
        favoriteStatuses,
        currentUserId,
        unsyncedCount,
        lastSyncTime,
        isSyncing,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteInitial value) initial,
    required TResult Function(FavoriteLoading value) loading,
    required TResult Function(FavoriteLoaded value) loaded,
    required TResult Function(FavoriteSyncing value) syncing,
    required TResult Function(FavoriteError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteInitial value)? initial,
    TResult? Function(FavoriteLoading value)? loading,
    TResult? Function(FavoriteLoaded value)? loaded,
    TResult? Function(FavoriteSyncing value)? syncing,
    TResult? Function(FavoriteError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteInitial value)? initial,
    TResult Function(FavoriteLoading value)? loading,
    TResult Function(FavoriteLoaded value)? loaded,
    TResult Function(FavoriteSyncing value)? syncing,
    TResult Function(FavoriteError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class FavoriteLoaded implements FavoriteState {
  const factory FavoriteLoaded({
    required final Map<String, bool> favoriteStatuses,
    required final String currentUserId,
    final int unsyncedCount,
    final DateTime? lastSyncTime,
    final bool isSyncing,
  }) = _$FavoriteLoadedImpl;

  /// Map of "contentType_id" → isFavorite
  /// Used for fast isFavorite checks in UI
  /// Example: {"movie_550": true, "series_1399": true}
  Map<String, bool> get favoriteStatuses;

  /// Current user ID ('guest' or actual UID)
  String get currentUserId;

  /// Number of favorites not yet synced to cloud
  /// Used for badge: "3 pending"
  int get unsyncedCount;

  /// Last time we synced with cloud
  /// Used to show: "Synced 5 minutes ago"
  DateTime? get lastSyncTime;

  /// Is currently syncing from cloud
  /// Used to show sync indicator
  bool get isSyncing;
  @JsonKey(ignore: true)
  _$$FavoriteLoadedImplCopyWith<_$FavoriteLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavoriteSyncingImplCopyWith<$Res> {
  factory _$$FavoriteSyncingImplCopyWith(
    _$FavoriteSyncingImpl value,
    $Res Function(_$FavoriteSyncingImpl) then,
  ) = __$$FavoriteSyncingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String currentUserId});
}

/// @nodoc
class __$$FavoriteSyncingImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$FavoriteSyncingImpl>
    implements _$$FavoriteSyncingImplCopyWith<$Res> {
  __$$FavoriteSyncingImplCopyWithImpl(
    _$FavoriteSyncingImpl _value,
    $Res Function(_$FavoriteSyncingImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? currentUserId = null}) {
    return _then(
      _$FavoriteSyncingImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        currentUserId: null == currentUserId
            ? _value.currentUserId
            : currentUserId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$FavoriteSyncingImpl implements FavoriteSyncing {
  const _$FavoriteSyncingImpl({
    required this.message,
    required this.currentUserId,
  });

  @override
  final String message;
  @override
  final String currentUserId;

  @override
  String toString() {
    return 'FavoriteState.syncing(message: $message, currentUserId: $currentUserId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteSyncingImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.currentUserId, currentUserId) ||
                other.currentUserId == currentUserId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, currentUserId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteSyncingImplCopyWith<_$FavoriteSyncingImpl> get copyWith =>
      __$$FavoriteSyncingImplCopyWithImpl<_$FavoriteSyncingImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      Map<String, bool> favoriteStatuses,
      String currentUserId,
      int unsyncedCount,
      DateTime? lastSyncTime,
      bool isSyncing,
    )
    loaded,
    required TResult Function(String message, String currentUserId) syncing,
    required TResult Function(String message) error,
  }) {
    return syncing(message, currentUserId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      Map<String, bool> favoriteStatuses,
      String currentUserId,
      int unsyncedCount,
      DateTime? lastSyncTime,
      bool isSyncing,
    )?
    loaded,
    TResult? Function(String message, String currentUserId)? syncing,
    TResult? Function(String message)? error,
  }) {
    return syncing?.call(message, currentUserId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      Map<String, bool> favoriteStatuses,
      String currentUserId,
      int unsyncedCount,
      DateTime? lastSyncTime,
      bool isSyncing,
    )?
    loaded,
    TResult Function(String message, String currentUserId)? syncing,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (syncing != null) {
      return syncing(message, currentUserId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteInitial value) initial,
    required TResult Function(FavoriteLoading value) loading,
    required TResult Function(FavoriteLoaded value) loaded,
    required TResult Function(FavoriteSyncing value) syncing,
    required TResult Function(FavoriteError value) error,
  }) {
    return syncing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteInitial value)? initial,
    TResult? Function(FavoriteLoading value)? loading,
    TResult? Function(FavoriteLoaded value)? loaded,
    TResult? Function(FavoriteSyncing value)? syncing,
    TResult? Function(FavoriteError value)? error,
  }) {
    return syncing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteInitial value)? initial,
    TResult Function(FavoriteLoading value)? loading,
    TResult Function(FavoriteLoaded value)? loaded,
    TResult Function(FavoriteSyncing value)? syncing,
    TResult Function(FavoriteError value)? error,
    required TResult orElse(),
  }) {
    if (syncing != null) {
      return syncing(this);
    }
    return orElse();
  }
}

abstract class FavoriteSyncing implements FavoriteState {
  const factory FavoriteSyncing({
    required final String message,
    required final String currentUserId,
  }) = _$FavoriteSyncingImpl;

  String get message;
  String get currentUserId;
  @JsonKey(ignore: true)
  _$$FavoriteSyncingImplCopyWith<_$FavoriteSyncingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavoriteErrorImplCopyWith<$Res> {
  factory _$$FavoriteErrorImplCopyWith(
    _$FavoriteErrorImpl value,
    $Res Function(_$FavoriteErrorImpl) then,
  ) = __$$FavoriteErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FavoriteErrorImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$FavoriteErrorImpl>
    implements _$$FavoriteErrorImplCopyWith<$Res> {
  __$$FavoriteErrorImplCopyWithImpl(
    _$FavoriteErrorImpl _value,
    $Res Function(_$FavoriteErrorImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$FavoriteErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$FavoriteErrorImpl implements FavoriteError {
  const _$FavoriteErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'FavoriteState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteErrorImplCopyWith<_$FavoriteErrorImpl> get copyWith =>
      __$$FavoriteErrorImplCopyWithImpl<_$FavoriteErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      Map<String, bool> favoriteStatuses,
      String currentUserId,
      int unsyncedCount,
      DateTime? lastSyncTime,
      bool isSyncing,
    )
    loaded,
    required TResult Function(String message, String currentUserId) syncing,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      Map<String, bool> favoriteStatuses,
      String currentUserId,
      int unsyncedCount,
      DateTime? lastSyncTime,
      bool isSyncing,
    )?
    loaded,
    TResult? Function(String message, String currentUserId)? syncing,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      Map<String, bool> favoriteStatuses,
      String currentUserId,
      int unsyncedCount,
      DateTime? lastSyncTime,
      bool isSyncing,
    )?
    loaded,
    TResult Function(String message, String currentUserId)? syncing,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteInitial value) initial,
    required TResult Function(FavoriteLoading value) loading,
    required TResult Function(FavoriteLoaded value) loaded,
    required TResult Function(FavoriteSyncing value) syncing,
    required TResult Function(FavoriteError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteInitial value)? initial,
    TResult? Function(FavoriteLoading value)? loading,
    TResult? Function(FavoriteLoaded value)? loaded,
    TResult? Function(FavoriteSyncing value)? syncing,
    TResult? Function(FavoriteError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteInitial value)? initial,
    TResult Function(FavoriteLoading value)? loading,
    TResult Function(FavoriteLoaded value)? loaded,
    TResult Function(FavoriteSyncing value)? syncing,
    TResult Function(FavoriteError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FavoriteError implements FavoriteState {
  const factory FavoriteError({required final String message}) =
      _$FavoriteErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FavoriteErrorImplCopyWith<_$FavoriteErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
