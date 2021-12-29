// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'route_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RouteDetailStateTearOff {
  const _$RouteDetailStateTearOff();

  _RouteDetailState call(
      {required RouteDetailStatus status,
      required Route route,
      required int routeId,
      required int direction,
      required List<ActiveBus> buses}) {
    return _RouteDetailState(
      status: status,
      route: route,
      routeId: routeId,
      direction: direction,
      buses: buses,
    );
  }
}

/// @nodoc
const $RouteDetailState = _$RouteDetailStateTearOff();

/// @nodoc
mixin _$RouteDetailState {
  RouteDetailStatus get status => throw _privateConstructorUsedError;
  Route get route => throw _privateConstructorUsedError;
  int get routeId => throw _privateConstructorUsedError;
  int get direction => throw _privateConstructorUsedError;
  List<ActiveBus> get buses => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RouteDetailStateCopyWith<RouteDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteDetailStateCopyWith<$Res> {
  factory $RouteDetailStateCopyWith(
          RouteDetailState value, $Res Function(RouteDetailState) then) =
      _$RouteDetailStateCopyWithImpl<$Res>;
  $Res call(
      {RouteDetailStatus status,
      Route route,
      int routeId,
      int direction,
      List<ActiveBus> buses});
}

/// @nodoc
class _$RouteDetailStateCopyWithImpl<$Res>
    implements $RouteDetailStateCopyWith<$Res> {
  _$RouteDetailStateCopyWithImpl(this._value, this._then);

  final RouteDetailState _value;
  // ignore: unused_field
  final $Res Function(RouteDetailState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? route = freezed,
    Object? routeId = freezed,
    Object? direction = freezed,
    Object? buses = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RouteDetailStatus,
      route: route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as Route,
      routeId: routeId == freezed
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as int,
      direction: direction == freezed
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as int,
      buses: buses == freezed
          ? _value.buses
          : buses // ignore: cast_nullable_to_non_nullable
              as List<ActiveBus>,
    ));
  }
}

/// @nodoc
abstract class _$RouteDetailStateCopyWith<$Res>
    implements $RouteDetailStateCopyWith<$Res> {
  factory _$RouteDetailStateCopyWith(
          _RouteDetailState value, $Res Function(_RouteDetailState) then) =
      __$RouteDetailStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {RouteDetailStatus status,
      Route route,
      int routeId,
      int direction,
      List<ActiveBus> buses});
}

/// @nodoc
class __$RouteDetailStateCopyWithImpl<$Res>
    extends _$RouteDetailStateCopyWithImpl<$Res>
    implements _$RouteDetailStateCopyWith<$Res> {
  __$RouteDetailStateCopyWithImpl(
      _RouteDetailState _value, $Res Function(_RouteDetailState) _then)
      : super(_value, (v) => _then(v as _RouteDetailState));

  @override
  _RouteDetailState get _value => super._value as _RouteDetailState;

  @override
  $Res call({
    Object? status = freezed,
    Object? route = freezed,
    Object? routeId = freezed,
    Object? direction = freezed,
    Object? buses = freezed,
  }) {
    return _then(_RouteDetailState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RouteDetailStatus,
      route: route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as Route,
      routeId: routeId == freezed
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as int,
      direction: direction == freezed
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as int,
      buses: buses == freezed
          ? _value.buses
          : buses // ignore: cast_nullable_to_non_nullable
              as List<ActiveBus>,
    ));
  }
}

/// @nodoc

class _$_RouteDetailState implements _RouteDetailState {
  _$_RouteDetailState(
      {required this.status,
      required this.route,
      required this.routeId,
      required this.direction,
      required this.buses});

  @override
  final RouteDetailStatus status;
  @override
  final Route route;
  @override
  final int routeId;
  @override
  final int direction;
  @override
  final List<ActiveBus> buses;

  @override
  String toString() {
    return 'RouteDetailState(status: $status, route: $route, routeId: $routeId, direction: $direction, buses: $buses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteDetailState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.route, route) &&
            const DeepCollectionEquality().equals(other.routeId, routeId) &&
            const DeepCollectionEquality().equals(other.direction, direction) &&
            const DeepCollectionEquality().equals(other.buses, buses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(route),
      const DeepCollectionEquality().hash(routeId),
      const DeepCollectionEquality().hash(direction),
      const DeepCollectionEquality().hash(buses));

  @JsonKey(ignore: true)
  @override
  _$RouteDetailStateCopyWith<_RouteDetailState> get copyWith =>
      __$RouteDetailStateCopyWithImpl<_RouteDetailState>(this, _$identity);
}

abstract class _RouteDetailState implements RouteDetailState {
  factory _RouteDetailState(
      {required RouteDetailStatus status,
      required Route route,
      required int routeId,
      required int direction,
      required List<ActiveBus> buses}) = _$_RouteDetailState;

  @override
  RouteDetailStatus get status;
  @override
  Route get route;
  @override
  int get routeId;
  @override
  int get direction;
  @override
  List<ActiveBus> get buses;
  @override
  @JsonKey(ignore: true)
  _$RouteDetailStateCopyWith<_RouteDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
