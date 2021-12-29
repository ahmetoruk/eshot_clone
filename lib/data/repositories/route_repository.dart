import 'package:eshot_clone/data/sources/local/local_data_source.dart';
import 'package:eshot_clone/data/sources/local/models/departure.dart';
import 'package:eshot_clone/data/sources/remote/remote_data_source.dart';
import 'package:eshot_clone/domain/entities/active_bus.dart';
import 'package:eshot_clone/domain/entities/departure_time.dart';
import 'package:eshot_clone/domain/entities/map_bus.dart';
import 'package:eshot_clone/domain/entities/route.dart';
import 'package:eshot_clone/domain/entities/route_info.dart';
import 'package:eshot_clone/domain/entities/route_point.dart';
import 'package:eshot_clone/domain/entities/search_result.dart';

abstract class IRouteRepository {
  Future<Route> getRoute(int routeId, int direction);
  Future<List<DepartureTime>> getRouteDepartureTimes(
      int routeId, int direction);
  Future<List<RouteInfo>> getAllRouteInfo();
  Future<List<RoutePoint>> getRoutePoints(int routeId, int direction);
  Future<List<MapBus>> getRouteBusLocations(int routeId, int direction);
  Future<List<ActiveBus>> getRouteIncomingBuses(int routeId, int direction);
  Future<List<SearchResult>> getSearchResults(String searchText);
  void addFavoriteRoute(int routeId);
  void removeFavoriteRoute(int routeId);
  Stream<List<int>> favoriteRouteChanges();
}

class RouteRepository implements IRouteRepository {
  final RouteRemoteDataSource remoteDataSource;
  final RouteLocalDataSource localDataSource;

  RouteRepository(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Route> getRoute(int routeId, int direction) async {
    try {
      final routeRemoteModel =
          await remoteDataSource.getRoute(routeId, direction);
      final routeHiveModel = routeRemoteModel.toHiveModel();
      await localDataSource.saveRoute(routeHiveModel);
    } catch (_) {}
    final routeHiveModel = await localDataSource.getRoute(routeId, direction);
    return routeHiveModel!.toEntity();
  }

  @override
  Future<List<DepartureTime>> getRouteDepartureTimes(
      int routeId, int direction) async {
    try {
      final routeDepartureRemoteModels =
          await remoteDataSource.getRouteDepartureTimes(routeId, direction);
      final departureTimes =
          routeDepartureRemoteModels.map((e) => e.toHiveModel()).toList();
      final routeDepartureHiveModel =
          DepartureHiveModel(routeId, direction, departureTimes);
      await localDataSource.saveBusDeparture(routeDepartureHiveModel);
    } catch (_) {}
    final busDepartureModel =
        await localDataSource.getBusDeparture(routeId, direction);
    final busDepartureTimeEntities =
        busDepartureModel!.departureTimes.map((e) => e.toEntity()).toList();
    return busDepartureTimeEntities;
  }

  @override
  Future<List<RouteInfo>> getAllRouteInfo() async {
    try {
      final routeRemoteModels = await remoteDataSource.getAllRouteInfo();
      final routeHiveModels = routeRemoteModels.map((e) => e.toHiveModel());
      await localDataSource.saveBusRouteInfos(routeHiveModels);
    } catch (_) {}
    final routeHiveModels = await localDataSource.getAllBusRouteInfos();
    return routeHiveModels.map((e) => e!.toEntity()).toList();
  }

  @override
  Future<List<ActiveBus>> getRouteIncomingBuses(
      int routeId, int direction) async {
    final results =
        await remoteDataSource.getRouteIncomingBuses(routeId, direction);
    return results.map<ActiveBus>((e) => e.toEntity()).toList();
  }

  @override
  Future<List<RoutePoint>> getRoutePoints(int routeId, int direction) async {
    final results = await remoteDataSource.getRoutePoints(routeId, direction);
    return results.map<RoutePoint>((e) => e.toEntity()).toList();
  }

  @override
  Future<List<MapBus>> getRouteBusLocations(int routeId, int direction) async {
    final results =
        await remoteDataSource.getRouteBusLocations(routeId, direction);
    return results.map<MapBus>((e) => e.toEntity()).toList();
  }

  @override
  Future<List<SearchResult>> getSearchResults(String searchText) async {
    final results = await remoteDataSource.getSearchResults(searchText);
    return results.map<SearchResult>((e) => e.toEntity()).toList();
  }

  @override
  void addFavoriteRoute(int routeId) {
    localDataSource.addFavoriteRoute(routeId);
  }

  @override
  void removeFavoriteRoute(int routeId) {
    localDataSource.removeFavoriteRoute(routeId);
  }

  @override
  Stream<List<int>> favoriteRouteChanges() =>
      localDataSource.favoriteRouteChanges();
}
