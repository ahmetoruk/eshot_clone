// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'route_info_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RouteInfoStateTearOff {
  const _$RouteInfoStateTearOff();

  _RouteInfoState call(
      {required RouteInfoStatus status, required List<RouteInfo> routes}) {
    return _RouteInfoState(
      status: status,
      routes: routes,
    );
  }
}

/// @nodoc
const $RouteInfoState = _$RouteInfoStateTearOff();

/// @nodoc
mixin _$RouteInfoState {
  RouteInfoStatus get status => throw _privateConstructorUsedError;
  List<RouteInfo> get routes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RouteInfoStateCopyWith<RouteInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteInfoStateCopyWith<$Res> {
  factory $RouteInfoStateCopyWith(
          RouteInfoState value, $Res Function(RouteInfoState) then) =
      _$RouteInfoStateCopyWithImpl<$Res>;
  $Res call({RouteInfoStatus status, List<RouteInfo> routes});
}

/// @nodoc
class _$RouteInfoStateCopyWithImpl<$Res>
    implements $RouteInfoStateCopyWith<$Res> {
  _$RouteInfoStateCopyWithImpl(this._value, this._then);

  final RouteInfoState _value;
  // ignore: unused_field
  final $Res Function(RouteInfoState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? routes = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RouteInfoStatus,
      routes: routes == freezed
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<RouteInfo>,
    ));
  }
}

/// @nodoc
abstract class _$RouteInfoStateCopyWith<$Res>
    implements $RouteInfoStateCopyWith<$Res> {
  factory _$RouteInfoStateCopyWith(
          _RouteInfoState value, $Res Function(_RouteInfoState) then) =
      __$RouteInfoStateCopyWithImpl<$Res>;
  @override
  $Res call({RouteInfoStatus status, List<RouteInfo> routes});
}

/// @nodoc
class __$RouteInfoStateCopyWithImpl<$Res>
    extends _$RouteInfoStateCopyWithImpl<$Res>
    implements _$RouteInfoStateCopyWith<$Res> {
  __$RouteInfoStateCopyWithImpl(
      _RouteInfoState _value, $Res Function(_RouteInfoState) _then)
      : super(_value, (v) => _then(v as _RouteInfoState));

  @override
  _RouteInfoState get _value => super._value as _RouteInfoState;

  @override
  $Res call({
    Object? status = freezed,
    Object? routes = freezed,
  }) {
    return _then(_RouteInfoState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RouteInfoStatus,
      routes: routes == freezed
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<RouteInfo>,
    ));
  }
}

/// @nodoc

class _$_RouteInfoState implements _RouteInfoState {
  _$_RouteInfoState({required this.status, required this.routes});

  @override
  final RouteInfoStatus status;
  @override
  final List<RouteInfo> routes;

  @override
  String toString() {
    return 'RouteInfoState(status: $status, routes: $routes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteInfoState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.routes, routes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(routes));

  @JsonKey(ignore: true)
  @override
  _$RouteInfoStateCopyWith<_RouteInfoState> get copyWith =>
      __$RouteInfoStateCopyWithImpl<_RouteInfoState>(this, _$identity);
}

abstract class _RouteInfoState implements RouteInfoState {
  factory _RouteInfoState(
      {required RouteInfoStatus status,
      required List<RouteInfo> routes}) = _$_RouteInfoState;

  @override
  RouteInfoStatus get status;
  @override
  List<RouteInfo> get routes;
  @override
  @JsonKey(ignore: true)
  _$RouteInfoStateCopyWith<_RouteInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
