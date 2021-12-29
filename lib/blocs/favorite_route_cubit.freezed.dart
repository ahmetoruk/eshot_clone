// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorite_route_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FavoriteRouteStateTearOff {
  const _$FavoriteRouteStateTearOff();

  _FavoriteRouteState call({required List<int> favoriteRoutes}) {
    return _FavoriteRouteState(
      favoriteRoutes: favoriteRoutes,
    );
  }
}

/// @nodoc
const $FavoriteRouteState = _$FavoriteRouteStateTearOff();

/// @nodoc
mixin _$FavoriteRouteState {
  List<int> get favoriteRoutes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoriteRouteStateCopyWith<FavoriteRouteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteRouteStateCopyWith<$Res> {
  factory $FavoriteRouteStateCopyWith(
          FavoriteRouteState value, $Res Function(FavoriteRouteState) then) =
      _$FavoriteRouteStateCopyWithImpl<$Res>;
  $Res call({List<int> favoriteRoutes});
}

/// @nodoc
class _$FavoriteRouteStateCopyWithImpl<$Res>
    implements $FavoriteRouteStateCopyWith<$Res> {
  _$FavoriteRouteStateCopyWithImpl(this._value, this._then);

  final FavoriteRouteState _value;
  // ignore: unused_field
  final $Res Function(FavoriteRouteState) _then;

  @override
  $Res call({
    Object? favoriteRoutes = freezed,
  }) {
    return _then(_value.copyWith(
      favoriteRoutes: favoriteRoutes == freezed
          ? _value.favoriteRoutes
          : favoriteRoutes // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
abstract class _$FavoriteRouteStateCopyWith<$Res>
    implements $FavoriteRouteStateCopyWith<$Res> {
  factory _$FavoriteRouteStateCopyWith(
          _FavoriteRouteState value, $Res Function(_FavoriteRouteState) then) =
      __$FavoriteRouteStateCopyWithImpl<$Res>;
  @override
  $Res call({List<int> favoriteRoutes});
}

/// @nodoc
class __$FavoriteRouteStateCopyWithImpl<$Res>
    extends _$FavoriteRouteStateCopyWithImpl<$Res>
    implements _$FavoriteRouteStateCopyWith<$Res> {
  __$FavoriteRouteStateCopyWithImpl(
      _FavoriteRouteState _value, $Res Function(_FavoriteRouteState) _then)
      : super(_value, (v) => _then(v as _FavoriteRouteState));

  @override
  _FavoriteRouteState get _value => super._value as _FavoriteRouteState;

  @override
  $Res call({
    Object? favoriteRoutes = freezed,
  }) {
    return _then(_FavoriteRouteState(
      favoriteRoutes: favoriteRoutes == freezed
          ? _value.favoriteRoutes
          : favoriteRoutes // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_FavoriteRouteState implements _FavoriteRouteState {
  _$_FavoriteRouteState({required this.favoriteRoutes});

  @override
  final List<int> favoriteRoutes;

  @override
  String toString() {
    return 'FavoriteRouteState(favoriteRoutes: $favoriteRoutes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FavoriteRouteState &&
            const DeepCollectionEquality()
                .equals(other.favoriteRoutes, favoriteRoutes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(favoriteRoutes));

  @JsonKey(ignore: true)
  @override
  _$FavoriteRouteStateCopyWith<_FavoriteRouteState> get copyWith =>
      __$FavoriteRouteStateCopyWithImpl<_FavoriteRouteState>(this, _$identity);
}

abstract class _FavoriteRouteState implements FavoriteRouteState {
  factory _FavoriteRouteState({required List<int> favoriteRoutes}) =
      _$_FavoriteRouteState;

  @override
  List<int> get favoriteRoutes;
  @override
  @JsonKey(ignore: true)
  _$FavoriteRouteStateCopyWith<_FavoriteRouteState> get copyWith =>
      throw _privateConstructorUsedError;
}
