import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:eshot_clone/data/repositories/route_repository.dart';
import 'package:eshot_clone/domain/entities/route_info.dart';

part 'route_info_cubit.freezed.dart';

enum RouteInfoStatus { initial, loading, loadad, failed }

@freezed
class RouteInfoState with _$RouteInfoState {
  factory RouteInfoState(
      {required RouteInfoStatus status,
      required List<RouteInfo> routes}) = _RouteInfoState;
}

extension X on List<RouteInfo> {
  RouteInfo? findById(int id) =>
      firstWhereOrNull((element) => element.routeId == id);
}

class RouteInfoCubit extends Cubit<RouteInfoState> {
  RouteInfoCubit({required this.routeRepository})
      : super(RouteInfoState(status: RouteInfoStatus.initial, routes: []));
  final RouteRepository routeRepository;

  void getAllRouteInfo() async {
    emit(state.copyWith(status: RouteInfoStatus.loading));
    try {
      final results = await routeRepository.getAllRouteInfo();
      emit(state.copyWith(status: RouteInfoStatus.loadad, routes: results));
    } catch (_) {
      emit(state.copyWith(status: RouteInfoStatus.failed));
    }
  }
}
