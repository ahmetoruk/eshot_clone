import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:eshot_clone/presentation/pages/favorite_routes_page/favorite_routes_page.dart';
import 'package:eshot_clone/presentation/pages/route_detail_page/route_detail_page.dart';
import 'package:eshot_clone/presentation/pages/route_hours_page/route_hours_page.dart';
import 'package:eshot_clone/presentation/pages/route_map_page/route_map_page.dart';
import 'package:eshot_clone/presentation/pages/search_page/search_page.dart';
import 'package:eshot_clone/presentation/pages/splash_page/splash_page.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        theme: ThemeData(
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Colors.red.shade700,
            onPrimary: Colors.white,
            primaryVariant: Colors.grey,
            secondary: Colors.grey,
            secondaryVariant: Colors.grey,
            onSecondary: Colors.grey,
            background: Colors.grey,
            onBackground: Colors.grey,
            surface: Colors.grey,
            onSurface: Colors.grey,
            error: Colors.grey,
            onError: Colors.grey,
          ),
        ),
        title: 'Eshot Clone',
      );

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) =>
            const MaterialPage(child: SplashPage()),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchPage(),
      ),
      GoRoute(
          path: '/route/:routeId',
          builder: (context, state) {
            int routeId = int.parse(state.params["routeId"]!);
            return RouteDetailPage(routeId: routeId);
          },
          routes: [
            GoRoute(
                path: 'hours/:direction',
                builder: (context, state) {
                  int routeId = int.parse(state.params["routeId"]!);
                  int direction = int.parse(state.params["direction"]!);
                  return RouteHoursPage(routeId: routeId, direction: direction);
                }),
            GoRoute(
              path: 'maps/:direction',
              builder: (context, state) {
                int routeId = int.parse(state.params["routeId"]!);
                int direction = int.parse(state.params["direction"]!);
                return RouteMapPage(routeId: routeId, direction: direction);
              },
            )
          ]),
      GoRoute(
        path: '/favorites',
        builder: (context, state) => const FavoriteRoutesPage(),
      ),
    ],
  );
}
