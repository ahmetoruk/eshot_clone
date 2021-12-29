// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'route_hours_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RouteHoursStateTearOff {
  const _$RouteHoursStateTearOff();

  _RouteHoursState call(
      {required RouteHoursStatus status,
      required int routeId,
      required int direction,
      required List<DepartureTime> departureTimes}) {
    return _RouteHoursState(
      status: status,
      routeId: routeId,
      direction: direction,
      departureTimes: departureTimes,
    );
  }
}

/// @nodoc
const $RouteHoursState = _$RouteHoursStateTearOff();

/// @nodoc
mixin _$RouteHoursState {
  RouteHoursStatus get status => throw _privateConstructorUsedError;
  int get routeId => throw _privateConstructorUsedError;
  int get direction => throw _privateConstructorUsedError;
  List<DepartureTime> get departureTimes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RouteHoursStateCopyWith<RouteHoursState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteHoursStateCopyWith<$Res> {
  factory $RouteHoursStateCopyWith(
          RouteHoursState value, $Res Function(RouteHoursState) then) =
      _$RouteHoursStateCopyWithImpl<$Res>;
  $Res call(
      {RouteHoursStatus status,
      int routeId,
      int direction,
      List<DepartureTime> departureTimes});
}

/// @nodoc
class _$RouteHoursStateCopyWithImpl<$Res>
    implements $RouteHoursStateCopyWith<$Res> {
  _$RouteHoursStateCopyWithImpl(this._value, this._then);

  final RouteHoursState _value;
  // ignore: unused_field
  final $Res Function(RouteHoursState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? routeId = freezed,
    Object? direction = freezed,
    Object? departureTimes = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RouteHoursStatus,
      routeId: routeId == freezed
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as int,
      direction: direction == freezed
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as int,
      departureTimes: departureTimes == freezed
          ? _value.departureTimes
          : departureTimes // ignore: cast_nullable_to_non_nullable
              as List<DepartureTime>,
    ));
  }
}

/// @nodoc
abstract class _$RouteHoursStateCopyWith<$Res>
    implements $RouteHoursStateCopyWith<$Res> {
  factory _$RouteHoursStateCopyWith(
          _RouteHoursState value, $Res Function(_RouteHoursState) then) =
      __$RouteHoursStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {RouteHoursStatus status,
      int routeId,
      int direction,
      List<DepartureTime> departureTimes});
}

/// @nodoc
class __$RouteHoursStateCopyWithImpl<$Res>
    extends _$RouteHoursStateCopyWithImpl<$Res>
    implements _$RouteHoursStateCopyWith<$Res> {
  __$RouteHoursStateCopyWithImpl(
      _RouteHoursState _value, $Res Function(_RouteHoursState) _then)
      : super(_value, (v) => _then(v as _RouteHoursState));

  @override
  _RouteHoursState get _value => super._value as _RouteHoursState;

  @override
  $Res call({
    Object? status = freezed,
    Object? routeId = freezed,
    Object? direction = freezed,
    Object? departureTimes = freezed,
  }) {
    return _then(_RouteHoursState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RouteHoursStatus,
      routeId: routeId == freezed
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as int,
      direction: direction == freezed
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as int,
      departureTimes: departureTimes == freezed
          ? _value.departureTimes
          : departureTimes // ignore: cast_nullable_to_non_nullable
              as List<DepartureTime>,
    ));
  }
}

/// @nodoc

class _$_RouteHoursState implements _RouteHoursState {
  _$_RouteHoursState(
      {required this.status,
      required this.routeId,
      required this.direction,
      required this.departureTimes});

  @override
  final RouteHoursStatus status;
  @override
  final int routeId;
  @override
  final int direction;
  @override
  final List<DepartureTime> departureTimes;

  @override
  String toString() {
    return 'RouteHoursState(status: $status, routeId: $routeId, direction: $direction, departureTimes: $departureTimes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteHoursState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.routeId, routeId) &&
            const DeepCollectionEquality().equals(other.direction, direction) &&
            const DeepCollectionEquality()
                .equals(other.departureTimes, departureTimes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(routeId),
      const DeepCollectionEquality().hash(direction),
      const DeepCollectionEquality().hash(departureTimes));

  @JsonKey(ignore: true)
  @override
  _$RouteHoursStateCopyWith<_RouteHoursState> get copyWith =>
      __$RouteHoursStateCopyWithImpl<_RouteHoursState>(this, _$identity);
}

abstract class _RouteHoursState implements RouteHoursState {
  factory _RouteHoursState(
      {required RouteHoursStatus status,
      required int routeId,
      required int direction,
      required List<DepartureTime> departureTimes}) = _$_RouteHoursState;

  @override
  RouteHoursStatus get status;
  @override
  int get routeId;
  @override
  int get direction;
  @override
  List<DepartureTime> get departureTimes;
  @override
  @JsonKey(ignore: true)
  _$RouteHoursStateCopyWith<_RouteHoursState> get copyWith =>
      throw _privateConstructorUsedError;
}
