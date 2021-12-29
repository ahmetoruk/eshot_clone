import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:eshot_clone/data/repositories/route_repository.dart';

part 'favorite_route_cubit.freezed.dart';

@freezed
class FavoriteRouteState with _$FavoriteRouteState {
  factory FavoriteRouteState({required List<int> favoriteRoutes}) =
      _FavoriteRouteState;
}

class FavoriteRouteCubit extends Cubit<FavoriteRouteState> {
  FavoriteRouteCubit({required this.routeRepository})
      : super(FavoriteRouteState(favoriteRoutes: [])) {
    _favoriteRouteSubscription?.cancel();
    _favoriteRouteSubscription = routeRepository.favoriteRouteChanges().listen(
      (list) {
        emit(FavoriteRouteState(favoriteRoutes: list));
      },
    );
  }
  final RouteRepository routeRepository;

  StreamSubscription? _favoriteRouteSubscription;

  void addFavoriteRoute(int routeId) {
    routeRepository.addFavoriteRoute(routeId);
  }

  void removeFavoriteRoute(int routeId) {
    routeRepository.removeFavoriteRoute(routeId);
  }

  @override
  Future<void> close() async {
    super.close();
    _favoriteRouteSubscription?.cancel();
  }
}
