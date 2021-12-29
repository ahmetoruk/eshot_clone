import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eshot_clone/blocs/route_hours_cubit.dart';
import 'package:eshot_clone/injectable.dart';
import 'package:eshot_clone/presentation/widgets/bus_info_card.dart';
import 'package:eshot_clone/presentation/widgets/connection_error.dart';

class RouteHoursPage extends StatelessWidget {
  const RouteHoursPage({Key? key, required this.routeId, this.direction = 1})
      : super(key: key);

  final int routeId, direction;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RouteHoursCubit>(
      create: (context) => RouteHoursCubit(
          routeRepository: getIt(), routeId: routeId, direction: direction),
      child: const RouteHoursView(),
    );
  }
}

class RouteHoursView extends StatelessWidget {
  const RouteHoursView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteHoursCubit, RouteHoursState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("${state.routeId} Kalkış Saatlari"),
          ),
          body: SafeArea(
            child: Builder(
              builder: (context) {
                Widget widget = Container();
                switch (state.status) {
                  case RouteHoursStatus.loading:
                    widget = const Center(
                      child: CircularProgressIndicator(),
                    );
                    break;
                  case RouteHoursStatus.loadad:
                    widget = Column(
                      children: [
                        const SizedBox(height: 5),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: ["Hafta İçi", "Cumartesi", "Pazar"]
                                .map((e) => ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        color: Colors.red.shade700,
                                        child: Text(
                                          e,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ))
                                .toList()),
                        const Divider(
                          height: 10,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...[1, 2, 3].map(
                                  (e) => Expanded(
                                    child: Column(
                                      children: state.departureTimes
                                          .where((element) => element.id == e)
                                          .map((departure) => Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    departure.clock,
                                                    style: const TextStyle(
                                                        fontSize: 16,
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
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                    break;
                  case RouteHoursStatus.failed:
                    widget = ConnectionError(
                        fetch: () => context
                            .read<RouteHoursCubit>()
                            .getRouteDepartureTimes(
                                state.routeId, state.direction));
                    break;
                  case RouteHoursStatus.initial:
                    break;
                }
                return Column(
                  children: [
                    Expanded(child: widget),
                    BusInfoCard(
                      routeId: state.routeId,
                      direction: state.direction,
                      onPressed: () => context
                          .read<RouteHoursCubit>()
                          .getRouteDepartureTimes(
                              state.routeId, state.direction == 1 ? 2 : 1),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
