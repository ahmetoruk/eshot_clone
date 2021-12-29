import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:eshot_clone/blocs/favorite_route_cubit.dart';
import 'package:eshot_clone/blocs/route_detail_cubit.dart';
import 'package:eshot_clone/domain/entities/active_bus.dart';
import 'package:eshot_clone/domain/entities/bus_stop.dart';
import 'package:eshot_clone/injectable.dart';
import 'package:eshot_clone/presentation/widgets/bus_info_card.dart';
import 'package:eshot_clone/presentation/widgets/connection_error.dart';

class RouteDetailPage extends StatelessWidget {
  const RouteDetailPage({Key? key, required this.routeId, this.direction = 1})
      : super(key: key);
  final int routeId, direction;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RouteDetailCubit>(
      create: (context) =>
          RouteDetailCubit(routeRepository: getIt(), routeId: routeId),
      child: const RouteDetailView(),
    );
  }
}

class RouteDetailView extends StatelessWidget {
  const RouteDetailView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteDetailCubit, RouteDetailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.routeId.toString()),
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Builder(builder: (context) {
                      switch (state.status) {
                        case RouteDetailStatus.waiting:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case RouteDetailStatus.loading:
                          return ListView(shrinkWrap: true, children: [
                            ...buildStopTiles(state.route.stops, state.buses)
                          ]);
                        case RouteDetailStatus.failed:
                          return ConnectionError(
                              fetch: () => context
                                  .read<RouteDetailCubit>()
                                  .getRouteDetail(
                                      state.routeId, state.direction));
                        case RouteDetailStatus.initial:
                          return Container();
                      }
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: ElevatedButton.icon(
                            onPressed: () => context.push(
                                "/route/${state.routeId}/maps/${state.direction}"),
                            icon: const Icon(Icons.map),
                            label: const Text("Haritadan bak"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: ElevatedButton.icon(
                            onPressed: () => context.push(
                                "/route/${state.routeId}/hours/${state.direction}"),
                            icon: const Icon(Icons.timer),
                            label: const Text("Hareket Saatleri"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  BusInfoCard(
                    routeId: state.routeId,
                    direction: state.direction,
                    onPressed: () => context
                        .read<RouteDetailCubit>()
                        .getRouteDetail(
                            state.routeId, state.direction == 1 ? 2 : 1),
                  ),
                ],
              ),
              Positioned(
                bottom: 120,
                right: 5,
                child: Builder(
                  builder: (context) {
                    final favoriteRouteCubit =
                        context.watch<FavoriteRouteCubit>();
                    final isExist = favoriteRouteCubit.state.favoriteRoutes
                        .contains(state.routeId);
                    return FloatingActionButton(
                      backgroundColor:
                          !isExist ? Colors.grey.shade500 : Colors.red.shade800,
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                      onPressed: () => !isExist
                          ? favoriteRouteCubit.addFavoriteRoute(state.routeId)
                          : favoriteRouteCubit
                              .removeFavoriteRoute(state.routeId),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

List<ListTile> buildStopTiles(List<BusStop> stops, List<ActiveBus> buses) {
  final List<ListTile> tiles = [];

  int count = stops.length - 1;
  for (BusStop stop in stops) {
    bool busNear =
        buses.where((element) => element.stopsLeft == count).isNotEmpty;
    count--;

    final tile = ListTile(
      leading: Column(
        children: [
          const Icon(Icons.circle, size: 26),
          const SizedBox(height: 5),
          Expanded(
            child: Container(
              width: 1,
              color: Colors.grey,
            ),
          )
        ],
      ),
      title: Text(
        stop.name + "-" + stop.stopId.toString(),
        style: TextStyle(color: busNear ? Colors.red : null),
      ),
      subtitle: Wrap(
        direction: Axis.horizontal,
        children: [
          ...stop.stopBuses.split(";").map(
                (routeNumber) => Container(
                  color: Colors.redAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Text(
                    routeNumber,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              )
        ],
      ),
    );
    tiles.add(tile);
  }
  return tiles;
}
