import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:eshot_clone/data/repositories/route_repository.dart';
import 'package:eshot_clone/domain/entities/departure_time.dart';

part 'route_hours_cubit.freezed.dart';

enum RouteHoursStatus { initial, loading, loadad, failed }

@freezed
class RouteHoursState with _$RouteHoursState {
  factory RouteHoursState(
      {required RouteHoursStatus status,
      required int routeId,
      required int direction,
      required List<DepartureTime> departureTimes}) = _RouteHoursState;
}

class RouteHoursCubit extends Cubit<RouteHoursState> {
  RouteHoursCubit({
    required this.routeRepository,
    required int routeId,
    int direction = 1,
  }) : super(
          RouteHoursState(
            status: RouteHoursStatus.initial,
            routeId: routeId,
            direction: direction,
            departureTimes: [],
          ),
        ) {
    getRouteDepartureTimes(routeId, direction);
  }
  final RouteRepository routeRepository;

  void getRouteDepartureTimes(int routeId, [int direction = 1]) async {
    emit(state.copyWith(status: RouteHoursStatus.loading));
    try {
      final results =
          await routeRepository.getRouteDepartureTimes(routeId, direction);
      emit(state.copyWith(
          departureTimes: results,
          routeId: routeId,
          direction: direction,
          status: RouteHoursStatus.loadad));
    } catch (_) {
      emit(state.copyWith(status: RouteHoursStatus.failed));
    }
  }
}
