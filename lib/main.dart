import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eshot_clone/app.dart';
import 'package:eshot_clone/blocs/auth_cubit.dart';
import 'package:eshot_clone/blocs/favorite_route_cubit.dart';
import 'package:eshot_clone/blocs/route_info_cubit.dart';
import 'package:eshot_clone/data/sources/local/local_data_source.dart';
import 'package:eshot_clone/injectable.dart';

void main() async {
  await RouteLocalDataSource.initialize();
  setupInjectable();

  runApp(
    BlocProvider(
      create: (_) => AuthCubit(getIt())..getToken(),
      child: BlocProvider(
        create: (_) =>
            RouteInfoCubit(routeRepository: getIt())..getAllRouteInfo(),
        child: BlocProvider(
          create: (_) => FavoriteRouteCubit(routeRepository: getIt()),
          child: App(),
        ),
      ),
    ),
  );
}
