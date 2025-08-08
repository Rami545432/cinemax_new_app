// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fetch_movie_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FetchDetailsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) failure,
    required TResult Function(MovieDetailsEntity movie) successMovie,
    required TResult Function(SeriesDetailsEntity series) successSeries,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? failure,
    TResult? Function(MovieDetailsEntity movie)? successMovie,
    TResult? Function(SeriesDetailsEntity series)? successSeries,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? failure,
    TResult Function(MovieDetailsEntity movie)? successMovie,
    TResult Function(SeriesDetailsEntity series)? successSeries,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SuccessMovie value) successMovie,
    required TResult Function(_SuccessSeries value) successSeries,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_SuccessMovie value)? successMovie,
    TResult? Function(_SuccessSeries value)? successSeries,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_SuccessMovie value)? successMovie,
    TResult Function(_SuccessSeries value)? successSeries,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchDetailsStateCopyWith<$Res> {
  factory $FetchDetailsStateCopyWith(
          FetchDetailsState value, $Res Function(FetchDetailsState) then) =
      _$FetchDetailsStateCopyWithImpl<$Res, FetchDetailsState>;
}

/// @nodoc
class _$FetchDetailsStateCopyWithImpl<$Res, $Val extends FetchDetailsState>
    implements $FetchDetailsStateCopyWith<$Res> {
  _$FetchDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FetchDetailsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$FetchDetailsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of FetchDetailsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'FetchDetailsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) failure,
    required TResult Function(MovieDetailsEntity movie) successMovie,
    required TResult Function(SeriesDetailsEntity series) successSeries,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? failure,
    TResult? Function(MovieDetailsEntity movie)? successMovie,
    TResult? Function(SeriesDetailsEntity series)? successSeries,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? failure,
    TResult Function(MovieDetailsEntity movie)? successMovie,
    TResult Function(SeriesDetailsEntity series)? successSeries,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SuccessMovie value) successMovie,
    required TResult Function(_SuccessSeries value) successSeries,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_SuccessMovie value)? successMovie,
    TResult? Function(_SuccessSeries value)? successSeries,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_SuccessMovie value)? successMovie,
    TResult Function(_SuccessSeries value)? successSeries,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FetchDetailsState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$FetchDetailsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of FetchDetailsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'FetchDetailsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) failure,
    required TResult Function(MovieDetailsEntity movie) successMovie,
    required TResult Function(SeriesDetailsEntity series) successSeries,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? failure,
    TResult? Function(MovieDetailsEntity movie)? successMovie,
    TResult? Function(SeriesDetailsEntity series)? successSeries,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? failure,
    TResult Function(MovieDetailsEntity movie)? successMovie,
    TResult Function(SeriesDetailsEntity series)? successSeries,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SuccessMovie value) successMovie,
    required TResult Function(_SuccessSeries value) successSeries,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_SuccessMovie value)? successMovie,
    TResult? Function(_SuccessSeries value)? successSeries,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_SuccessMovie value)? successMovie,
    TResult Function(_SuccessSeries value)? successSeries,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements FetchDetailsState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$FetchDetailsStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of FetchDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$FailureImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.message);

  @override
  final String? message;

  @override
  String toString() {
    return 'FetchDetailsState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of FetchDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) failure,
    required TResult Function(MovieDetailsEntity movie) successMovie,
    required TResult Function(SeriesDetailsEntity series) successSeries,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? failure,
    TResult? Function(MovieDetailsEntity movie)? successMovie,
    TResult? Function(SeriesDetailsEntity series)? successSeries,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? failure,
    TResult Function(MovieDetailsEntity movie)? successMovie,
    TResult Function(SeriesDetailsEntity series)? successSeries,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SuccessMovie value) successMovie,
    required TResult Function(_SuccessSeries value) successSeries,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_SuccessMovie value)? successMovie,
    TResult? Function(_SuccessSeries value)? successSeries,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_SuccessMovie value)? successMovie,
    TResult Function(_SuccessSeries value)? successSeries,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements FetchDetailsState {
  const factory _Failure(final String? message) = _$FailureImpl;

  String? get message;

  /// Create a copy of FetchDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessMovieImplCopyWith<$Res> {
  factory _$$SuccessMovieImplCopyWith(
          _$SuccessMovieImpl value, $Res Function(_$SuccessMovieImpl) then) =
      __$$SuccessMovieImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MovieDetailsEntity movie});
}

/// @nodoc
class __$$SuccessMovieImplCopyWithImpl<$Res>
    extends _$FetchDetailsStateCopyWithImpl<$Res, _$SuccessMovieImpl>
    implements _$$SuccessMovieImplCopyWith<$Res> {
  __$$SuccessMovieImplCopyWithImpl(
      _$SuccessMovieImpl _value, $Res Function(_$SuccessMovieImpl) _then)
      : super(_value, _then);

  /// Create a copy of FetchDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
  }) {
    return _then(_$SuccessMovieImpl(
      null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as MovieDetailsEntity,
    ));
  }
}

/// @nodoc

class _$SuccessMovieImpl implements _SuccessMovie {
  const _$SuccessMovieImpl(this.movie);

  @override
  final MovieDetailsEntity movie;

  @override
  String toString() {
    return 'FetchDetailsState.successMovie(movie: $movie)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessMovieImpl &&
            (identical(other.movie, movie) || other.movie == movie));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movie);

  /// Create a copy of FetchDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessMovieImplCopyWith<_$SuccessMovieImpl> get copyWith =>
      __$$SuccessMovieImplCopyWithImpl<_$SuccessMovieImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) failure,
    required TResult Function(MovieDetailsEntity movie) successMovie,
    required TResult Function(SeriesDetailsEntity series) successSeries,
  }) {
    return successMovie(movie);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? failure,
    TResult? Function(MovieDetailsEntity movie)? successMovie,
    TResult? Function(SeriesDetailsEntity series)? successSeries,
  }) {
    return successMovie?.call(movie);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? failure,
    TResult Function(MovieDetailsEntity movie)? successMovie,
    TResult Function(SeriesDetailsEntity series)? successSeries,
    required TResult orElse(),
  }) {
    if (successMovie != null) {
      return successMovie(movie);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SuccessMovie value) successMovie,
    required TResult Function(_SuccessSeries value) successSeries,
  }) {
    return successMovie(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_SuccessMovie value)? successMovie,
    TResult? Function(_SuccessSeries value)? successSeries,
  }) {
    return successMovie?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_SuccessMovie value)? successMovie,
    TResult Function(_SuccessSeries value)? successSeries,
    required TResult orElse(),
  }) {
    if (successMovie != null) {
      return successMovie(this);
    }
    return orElse();
  }
}

abstract class _SuccessMovie implements FetchDetailsState {
  const factory _SuccessMovie(final MovieDetailsEntity movie) =
      _$SuccessMovieImpl;

  MovieDetailsEntity get movie;

  /// Create a copy of FetchDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessMovieImplCopyWith<_$SuccessMovieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessSeriesImplCopyWith<$Res> {
  factory _$$SuccessSeriesImplCopyWith(
          _$SuccessSeriesImpl value, $Res Function(_$SuccessSeriesImpl) then) =
      __$$SuccessSeriesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SeriesDetailsEntity series});
}

/// @nodoc
class __$$SuccessSeriesImplCopyWithImpl<$Res>
    extends _$FetchDetailsStateCopyWithImpl<$Res, _$SuccessSeriesImpl>
    implements _$$SuccessSeriesImplCopyWith<$Res> {
  __$$SuccessSeriesImplCopyWithImpl(
      _$SuccessSeriesImpl _value, $Res Function(_$SuccessSeriesImpl) _then)
      : super(_value, _then);

  /// Create a copy of FetchDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? series = null,
  }) {
    return _then(_$SuccessSeriesImpl(
      null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as SeriesDetailsEntity,
    ));
  }
}

/// @nodoc

class _$SuccessSeriesImpl implements _SuccessSeries {
  const _$SuccessSeriesImpl(this.series);

  @override
  final SeriesDetailsEntity series;

  @override
  String toString() {
    return 'FetchDetailsState.successSeries(series: $series)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessSeriesImpl &&
            (identical(other.series, series) || other.series == series));
  }

  @override
  int get hashCode => Object.hash(runtimeType, series);

  /// Create a copy of FetchDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessSeriesImplCopyWith<_$SuccessSeriesImpl> get copyWith =>
      __$$SuccessSeriesImplCopyWithImpl<_$SuccessSeriesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) failure,
    required TResult Function(MovieDetailsEntity movie) successMovie,
    required TResult Function(SeriesDetailsEntity series) successSeries,
  }) {
    return successSeries(series);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? failure,
    TResult? Function(MovieDetailsEntity movie)? successMovie,
    TResult? Function(SeriesDetailsEntity series)? successSeries,
  }) {
    return successSeries?.call(series);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? failure,
    TResult Function(MovieDetailsEntity movie)? successMovie,
    TResult Function(SeriesDetailsEntity series)? successSeries,
    required TResult orElse(),
  }) {
    if (successSeries != null) {
      return successSeries(series);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SuccessMovie value) successMovie,
    required TResult Function(_SuccessSeries value) successSeries,
  }) {
    return successSeries(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_SuccessMovie value)? successMovie,
    TResult? Function(_SuccessSeries value)? successSeries,
  }) {
    return successSeries?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_SuccessMovie value)? successMovie,
    TResult Function(_SuccessSeries value)? successSeries,
    required TResult orElse(),
  }) {
    if (successSeries != null) {
      return successSeries(this);
    }
    return orElse();
  }
}

abstract class _SuccessSeries implements FetchDetailsState {
  const factory _SuccessSeries(final SeriesDetailsEntity series) =
      _$SuccessSeriesImpl;

  SeriesDetailsEntity get series;

  /// Create a copy of FetchDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessSeriesImplCopyWith<_$SuccessSeriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
