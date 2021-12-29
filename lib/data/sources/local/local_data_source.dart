import 'package:hive_flutter/hive_flutter.dart';
import 'package:listenable_stream/listenable_stream.dart';
import 'package:rxdart/rxdart.dart';

import 'package:eshot_clone/data/sources/local/models/bus_stop.dart';
import 'package:eshot_clone/data/sources/local/models/departure.dart';
import 'package:eshot_clone/data/sources/local/models/departure_time.dart';
import 'package:eshot_clone/data/sources/local/models/route.dart';
import 'package:eshot_clone/data/sources/local/models/route_info.dart';

class RouteLocalDataSource {
  static String favoriteRouteBoxKey = "favorite_route";
  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter<RouteHiveModel>(RouteHiveModelAdapter());
    Hive.registerAdapter<DepartureHiveModel>(DepartureHiveModelAdapter());
    Hive.registerAdapter<RouteInfoHiveModel>(RouteInfoHiveModelAdapter());
    Hive.registerAdapter<DepartureTimeHiveModel>(
        DepartureTimeHiveModelAdapter());
    Hive.registerAdapter<BusStopHiveModel>(BusStopHiveModelAdapter());
    await Hive.openBox<RouteHiveModel>(RouteHiveModel.boxKey);
    await Hive.openBox<DepartureHiveModel>(DepartureHiveModel.boxKey);
    await Hive.openBox<RouteInfoHiveModel>(RouteInfoHiveModel.boxKey);
    await Hive.openBox<DepartureTimeHiveModel>(DepartureTimeHiveModel.boxKey);
    await Hive.openBox<bool>(favoriteRouteBoxKey);
  }

  Future<bool> hasData() async {
    final busRoutebox = Hive.box<RouteHiveModel>(RouteHiveModel.boxKey);
    return busRoutebox.length > 0;
  }

  Future<List<RouteInfoHiveModel?>> getAllBusRouteInfos() async {
    final busRouteBox = Hive.box<RouteInfoHiveModel>(RouteInfoHiveModel.boxKey);
    final busRoutes =
        List.generate(busRouteBox.length, (index) => busRouteBox.getAt(index));

    return busRoutes;
  }

  Future<void> saveBusRouteInfos(Iterable<RouteInfoHiveModel> busRoutes) async {
    final busRouteBox = Hive.box<RouteInfoHiveModel>(RouteInfoHiveModel.boxKey);
    final busRoutesMap = {for (var e in busRoutes) e.routeId: e};
    await busRouteBox.clear();
    await busRouteBox.putAll(busRoutesMap);
  }

  Future<void> saveBusDeparture(DepartureHiveModel busDepartureTime) async {
    final busRouteBox = Hive.box<DepartureHiveModel>(DepartureHiveModel.boxKey);
    final key = "${busDepartureTime.routeId}-${busDepartureTime.direction}";
    await busRouteBox.put(key, busDepartureTime);
  }

  Future<DepartureHiveModel?> getBusDeparture(
      int routeId, int direction) async {
    final busRouteBox = Hive.box<DepartureHiveModel>(DepartureHiveModel.boxKey);
    final key = "$routeId-$direction";
    return busRouteBox.get(key);
  }

  Future<RouteHiveModel?> getRoute(int routeId, int direction) async {
    final busRouteBox = Hive.box<RouteHiveModel>(RouteHiveModel.boxKey);
    final key = "$routeId-$direction-route-detail";
    return busRouteBox.get(key);
  }

  Future<void> saveRoute(RouteHiveModel busDepartureTime) async {
    final busRouteBox = Hive.box<RouteHiveModel>(RouteHiveModel.boxKey);
    final key =
        "${busDepartureTime.routeId}-${busDepartureTime.direction}-route-detail";
    await busRouteBox.put(key, busDepartureTime);
  }

  Future<void> addFavoriteRoute(int routeId) async {
    final busRouteBox = Hive.box<bool>(favoriteRouteBoxKey);
    busRouteBox.put(routeId, true);
  }

  Future<void> removeFavoriteRoute(int routeId) async {
    final busRouteBox = Hive.box<bool>(favoriteRouteBoxKey);
    busRouteBox.delete(routeId);
  }

  Stream<List<int>> favoriteRouteChanges() {
    final busRouteBox = Hive.box<bool>(favoriteRouteBoxKey);
    return busRouteBox
        .listenable()
        .toStream()
        .map((listenableBox) => listenableBox.value)
        .startWith(busRouteBox)
        .map<List<int>>((e) => [...e.keys.cast<int>()]);
  }
}
