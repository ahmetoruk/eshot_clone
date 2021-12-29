import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:eshot_clone/blocs/route_hours_cubit.dart';
import 'package:eshot_clone/blocs/route_map_cubit.dart';
import 'package:eshot_clone/injectable.dart';
import 'package:eshot_clone/presentation/widgets/bus_info_card.dart';
import 'package:eshot_clone/utils/extentions.dart';

class RouteMapPage extends StatelessWidget {
  const RouteMapPage({Key? key, required this.routeId, this.direction = 1})
      : super(key: key);
  final int routeId, direction;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RouteMapCubit>(
      create: (context) => RouteMapCubit(
          routeRepository: getIt(), routeId: routeId, direction: direction),
      child: BlocProvider<RouteHoursCubit>(
        create: (context) => RouteHoursCubit(
            routeRepository: getIt(), routeId: routeId, direction: direction),
        child: const RouteMapView(),
      ),
    );
  }
}

class RouteMapView extends StatelessWidget {
  const RouteMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Harita")),
      body: BlocBuilder<RouteMapCubit, RouteMapState>(
        builder: (context, state) {
          return Stack(
            children: [
              GoogleMap(
                myLocationEnabled: true,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(38.4836717, 27.0978878),
                  zoom: 13,
                ),
                zoomControlsEnabled: false,
                polylines: state.polylines,
                markers: [state.markers, state.busMarkers]
                    .expand((element) => element)
                    .toSet(),
              ),
              state.activeBusStop == null
                  ? Container()
                  : Align(
                      alignment: Alignment.topCenter,
                      child: Card(
                        child: ListTile(
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
                            state.activeBusStop!.name +
                                "-" +
                                state.activeBusStop!.stopId.toString(),
                          ),
                          subtitle: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...state.activeBusStop!.stopBuses
                                    .split(";")
                                    .map(
                                      (routeNumber) => Container(
                                        color: Colors.redAccent,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 5),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 5),
                                        child: Text(
                                          routeNumber,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BlocBuilder<RouteHoursCubit, RouteHoursState>(
                        builder: (context, hourState) {
                      final date = DateTime.now();
                      return SizedBox(
                        height: 200,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                color: Colors.red.shade700,
                                child: Text(
                                  date.dayText,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Card(
                                  color: Colors.white70,
                                  child: Container(
                                    padding: const EdgeInsets.all(7),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: hourState.departureTimes
                                          .where((element) =>
                                              element.id == date.tarifeDay)
                                          .map((departure) => Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    departure.clock,
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Opacity(
                                                    opacity:
                                                        departure.accessible
                                                            ? 1
                                                            : 0,
                                                    child: ClipOval(
                                                      child: Container(
                                                        color: Colors.blue,
                                                        margin: const EdgeInsets
                                                            .all(2),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2),
                                                        child: const Icon(
                                                          Icons
                                                              .accessible_rounded,
                                                          color: Colors.white,
                                                          size: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Opacity(
                                                    opacity:
                                                        departure.bike ? 1 : 0,
                                                    child: ClipOval(
                                                      child: Container(
                                                        color: Colors.green,
                                                        margin: const EdgeInsets
                                                            .all(2),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2),
                                                        child: const Icon(
                                                          Icons.pedal_bike,
                                                          color: Colors.white,
                                                          size: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    BusInfoCard(
                      routeId: state.routeId,
                      direction: state.direction,
                      onPressed: () {
                        context.read<RouteMapCubit>().getRoute(
                            state.routeId, state.direction == 1 ? 2 : 1);
                        context.read<RouteHoursCubit>().getRouteDepartureTimes(
                            state.routeId, state.direction == 1 ? 2 : 1);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
