import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:eshot_clone/data/repositories/route_repository.dart';
import 'package:eshot_clone/domain/entities/active_bus.dart';
import 'package:eshot_clone/domain/entities/route.dart';

part 'route_detail_cubit.freezed.dart';

enum RouteDetailStatus {
  initial,
  waiting,
  loading,
  failed,
}

@freezed
class RouteDetailState with _$RouteDetailState {
  factory RouteDetailState(
      {required RouteDetailStatus status,
      required Route route,
      required int routeId,
      required int direction,
      required List<ActiveBus> buses}) = _RouteDetailState;
}

class RouteDetailCubit extends Cubit<RouteDetailState> {
  RouteDetailCubit({
    required this.routeRepository,
    required int routeId,
    int direction = 1,
  }) : super(
          RouteDetailState(
            status: RouteDetailStatus.initial,
            route: const Route(routeStart: "", routeEnd: "", stops: []),
            routeId: routeId,
            direction: direction,
            buses: [],
          ),
        ) {
    getRouteDetail(routeId);
  }
  final RouteRepository routeRepository;

  void getRouteDetail(int routeId, [int direction = 1]) async {
    emit(state.copyWith(status: RouteDetailStatus.waiting));
    try {
      final route = await routeRepository.getRoute(routeId, direction);
      emit(state.copyWith(
          route: route,
          routeId: routeId,
          direction: direction,
          status: RouteDetailStatus.loading));
    } catch (e) {
      emit(state.copyWith(status: RouteDetailStatus.failed));
    }
    getRouteIncomingBuses();
  }

  void getRouteIncomingBuses() async {
    emit(state.copyWith(status: RouteDetailStatus.loading));
    try {
      final results = await routeRepository.getRouteIncomingBuses(
          state.routeId, state.route.stops.last.stopId);
      emit(state.copyWith(buses: results, status: RouteDetailStatus.loading));
    } catch (_) {
      emit(state.copyWith(status: RouteDetailStatus.failed));
    }
  }
}
