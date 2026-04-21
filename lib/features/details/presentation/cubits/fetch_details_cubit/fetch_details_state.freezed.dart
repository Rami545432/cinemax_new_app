// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fetch_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FetchDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FetchDetailsState()';
}


}

/// @nodoc
class $FetchDetailsStateCopyWith<$Res>  {
$FetchDetailsStateCopyWith(FetchDetailsState _, $Res Function(FetchDetailsState) __);
}


/// Adds pattern-matching-related methods to [FetchDetailsState].
extension FetchDetailsStatePatterns on FetchDetailsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Failure value)?  failure,TResult Function( _SuccessMovie value)?  successMovie,TResult Function( _SuccessSeries value)?  successSeries,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Failure() when failure != null:
return failure(_that);case _SuccessMovie() when successMovie != null:
return successMovie(_that);case _SuccessSeries() when successSeries != null:
return successSeries(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Failure value)  failure,required TResult Function( _SuccessMovie value)  successMovie,required TResult Function( _SuccessSeries value)  successSeries,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Failure():
return failure(_that);case _SuccessMovie():
return successMovie(_that);case _SuccessSeries():
return successSeries(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Failure value)?  failure,TResult? Function( _SuccessMovie value)?  successMovie,TResult? Function( _SuccessSeries value)?  successSeries,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Failure() when failure != null:
return failure(_that);case _SuccessMovie() when successMovie != null:
return successMovie(_that);case _SuccessSeries() when successSeries != null:
return successSeries(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String? message)?  failure,TResult Function( MovieDetailsEntity movie)?  successMovie,TResult Function( SeriesDetailsEntity series)?  successSeries,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Failure() when failure != null:
return failure(_that.message);case _SuccessMovie() when successMovie != null:
return successMovie(_that.movie);case _SuccessSeries() when successSeries != null:
return successSeries(_that.series);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String? message)  failure,required TResult Function( MovieDetailsEntity movie)  successMovie,required TResult Function( SeriesDetailsEntity series)  successSeries,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Failure():
return failure(_that.message);case _SuccessMovie():
return successMovie(_that.movie);case _SuccessSeries():
return successSeries(_that.series);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String? message)?  failure,TResult? Function( MovieDetailsEntity movie)?  successMovie,TResult? Function( SeriesDetailsEntity series)?  successSeries,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Failure() when failure != null:
return failure(_that.message);case _SuccessMovie() when successMovie != null:
return successMovie(_that.movie);case _SuccessSeries() when successSeries != null:
return successSeries(_that.series);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements FetchDetailsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FetchDetailsState.initial()';
}


}




/// @nodoc


class _Loading implements FetchDetailsState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FetchDetailsState.loading()';
}


}




/// @nodoc


class _Failure implements FetchDetailsState {
  const _Failure(this.message);
  

 final  String? message;

/// Create a copy of FetchDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'FetchDetailsState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $FetchDetailsStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of FetchDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_Failure(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SuccessMovie implements FetchDetailsState {
  const _SuccessMovie(this.movie);
  

 final  MovieDetailsEntity movie;

/// Create a copy of FetchDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessMovieCopyWith<_SuccessMovie> get copyWith => __$SuccessMovieCopyWithImpl<_SuccessMovie>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessMovie&&(identical(other.movie, movie) || other.movie == movie));
}


@override
int get hashCode => Object.hash(runtimeType,movie);

@override
String toString() {
  return 'FetchDetailsState.successMovie(movie: $movie)';
}


}

/// @nodoc
abstract mixin class _$SuccessMovieCopyWith<$Res> implements $FetchDetailsStateCopyWith<$Res> {
  factory _$SuccessMovieCopyWith(_SuccessMovie value, $Res Function(_SuccessMovie) _then) = __$SuccessMovieCopyWithImpl;
@useResult
$Res call({
 MovieDetailsEntity movie
});




}
/// @nodoc
class __$SuccessMovieCopyWithImpl<$Res>
    implements _$SuccessMovieCopyWith<$Res> {
  __$SuccessMovieCopyWithImpl(this._self, this._then);

  final _SuccessMovie _self;
  final $Res Function(_SuccessMovie) _then;

/// Create a copy of FetchDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movie = null,}) {
  return _then(_SuccessMovie(
null == movie ? _self.movie : movie // ignore: cast_nullable_to_non_nullable
as MovieDetailsEntity,
  ));
}


}

/// @nodoc


class _SuccessSeries implements FetchDetailsState {
  const _SuccessSeries(this.series);
  

 final  SeriesDetailsEntity series;

/// Create a copy of FetchDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessSeriesCopyWith<_SuccessSeries> get copyWith => __$SuccessSeriesCopyWithImpl<_SuccessSeries>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessSeries&&(identical(other.series, series) || other.series == series));
}


@override
int get hashCode => Object.hash(runtimeType,series);

@override
String toString() {
  return 'FetchDetailsState.successSeries(series: $series)';
}


}

/// @nodoc
abstract mixin class _$SuccessSeriesCopyWith<$Res> implements $FetchDetailsStateCopyWith<$Res> {
  factory _$SuccessSeriesCopyWith(_SuccessSeries value, $Res Function(_SuccessSeries) _then) = __$SuccessSeriesCopyWithImpl;
@useResult
$Res call({
 SeriesDetailsEntity series
});




}
/// @nodoc
class __$SuccessSeriesCopyWithImpl<$Res>
    implements _$SuccessSeriesCopyWith<$Res> {
  __$SuccessSeriesCopyWithImpl(this._self, this._then);

  final _SuccessSeries _self;
  final $Res Function(_SuccessSeries) _then;

/// Create a copy of FetchDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? series = null,}) {
  return _then(_SuccessSeries(
null == series ? _self.series : series // ignore: cast_nullable_to_non_nullable
as SeriesDetailsEntity,
  ));
}


}

// dart format on
