import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:eshot_clone/blocs/favorite_route_cubit.dart';
import 'package:eshot_clone/blocs/route_info_cubit.dart';
import 'package:eshot_clone/presentation/widgets/bus_info_card.dart';

class FavoriteRoutesPage extends StatelessWidget {
  const FavoriteRoutesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteRouteCubit = context.watch<FavoriteRouteCubit>();
    return BlocBuilder<RouteInfoCubit, RouteInfoState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Favoriler"),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => context.push("/search"),
              )
            ],
          ),
          body: SafeArea(
            child: ListView(
              children: [
                ...state.routes
                    .where((element) => favoriteRouteCubit.state.favoriteRoutes
                        .contains(element.routeId))
                    .map(
                      (route) => BusInfoCard(
                          routeId: route.routeId,
                          direction: 1,
                          onTap: () => context.push("/route/${route.routeId}"),
                          onPressed: null),
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}
