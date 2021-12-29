import 'dart:async';
import 'dart:collection';
import 'dart:math' show Random;

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:eshot_clone/data/repositories/route_repository.dart';
import 'package:eshot_clone/domain/entities/bus_stop.dart';
import 'package:eshot_clone/domain/entities/route_point.dart';
import 'package:eshot_clone/utils/map.dart';

part 'route_map_cubit.freezed.dart';

final random = Random();

enum RouteMapStatus { initial, success, failure }

@freezed
class RouteMapState with _$RouteMapState {
  factory RouteMapState(
      {required RouteMapStatus status,
      required int routeId,
      required int direction,
      required List<RoutePoint> routePoints,
      required Set<Polyline> polylines,
      required Set<Marker> markers,
      required Set<Marker> busMarkers,
      required BusStop? activeBusStop}) = _RouteMapState;
}

class RouteMapCubit extends Cubit<RouteMapState> {
  RouteMapCubit(
      {required this.routeRepository, required int routeId, int direction = 1})
      : super(
          RouteMapState(
              status: RouteMapStatus.initial,
              routeId: routeId,
              direction: direction,
              routePoints: [],
              polylines: Set<Polyline>.unmodifiable([]),
              markers: Set<Marker>.unmodifiable([]),
              busMarkers: Set<Marker>.unmodifiable([]),
              activeBusStop: null),
        ) {
    getRoute(routeId, direction);
  }

  final RouteRepository routeRepository;

  Timer? _timer;
  void getRoute(int routeId, [int direction = 1]) async {
    emit(state.copyWith(routeId: routeId, direction: direction));
    getRoutePoints();
    startActiveBusTimer();
  }

  void getRouteActiveBuses() async {
    try {
      final liveBuses = await routeRepository.getRouteBusLocations(
          state.routeId, state.direction);
      final markers = HashSet<Marker>();
      final icon = await createCustomMarkerBitmap(state.routeId.toString());
      markers.addAll(
        liveBuses.map(
          (mapBus) => Marker(
              markerId: MarkerId(
                "bus_" +
                    mapBus.busId.toString() +
                    random.nextInt(9999999).toString(),
              ),
              zIndex: 99999,
              position: LatLng(mapBus.x, mapBus.y),
              icon: icon),
        ),
      );
      emit(state.copyWith(busMarkers: markers));
    } catch (_) {}
  }

  void getRoutePoints() async {
    try {
      final route =
          await routeRepository.getRoute(state.routeId, state.direction);

      final routePoints =
          await routeRepository.getRoutePoints(state.routeId, state.direction);

      Set<Polyline> polylines = HashSet<Polyline>();
      polylines.add(
        Polyline(
            polylineId: PolylineId("route_${state.routeId}"),
            color: Colors.lightBlue,
            width: 2,
            points: routePoints
                .map<LatLng>((e) => LatLng(
                      e.lat,
                      e.lng,
                    ))
                .toList()),
      );
      Set<Marker> markers = HashSet<Marker>();
      markers.addAll(
        route.stops.map(
          (busStop) => Marker(
            markerId: MarkerId(
              "stop_" + busStop.stopId.toString(),
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure),
            position: LatLng(busStop.y, busStop.x),
            onTap: () => emit(state.copyWith(activeBusStop: busStop)),
          ),
        ),
      );
      emit(state.copyWith(markers: markers, polylines: polylines));
    } catch (_) {}
  }

  void startActiveBusTimer() {
    getRouteActiveBuses();
    _timer?.cancel();

    _timer = Timer.periodic(
      const Duration(seconds: 10),
      (timer) => getRouteActiveBuses(),
    );
  }

  @override
  Future<void> close() async {
    super.close();
    _timer?.cancel();
  }
}
