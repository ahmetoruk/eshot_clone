import 'package:eshot_clone/data/sources/remote/models/active_bus.dart';
import 'package:eshot_clone/data/sources/remote/models/deperture_time.dart';
import 'package:eshot_clone/data/sources/remote/models/map_bus.dart';
import 'package:eshot_clone/data/sources/remote/models/route.dart';
import 'package:eshot_clone/data/sources/remote/models/route_info.dart';
import 'package:eshot_clone/data/sources/remote/models/route_point.dart';
import 'package:eshot_clone/data/sources/remote/models/search_result.dart';
import 'package:eshot_clone/services/eshot_api/eshot_api.dart';

abstract class IRouteRemoteDataSource {
  Future<RemoteRouteModel> getRoute(int routeId, int direction);
  Future<List<RemoteDepatureModel>> getRouteDepartureTimes(
      int routeId, int direction);
  Future<List<RemoteRouteInfoModel>> getAllRouteInfo();
  Future<List<RemoteActiveBusModel>> getRouteIncomingBuses(
      int routeId, int direction);
  Future<List<RemoteMapBusModel>> getRouteBusLocations(
      int routeId, int direction);
  Future<List<RemoteRoutePointModel>> getRoutePoints(
      int routeId, int direction);
  Future<List<RemoteSearchResultModel>> getSearchResults(String searchText);
}

class RouteRemoteDataSource implements IRouteRemoteDataSource {
  final EshotApi _eshotApi;

  RouteRemoteDataSource(this._eshotApi);
  @override
  Future<RemoteRouteModel> getRoute(int routeId, int direction) async {
    final result = await _eshotApi.getRoute(routeId, direction);
    return RemoteRouteModel.fromJson(result);
  }

  @override
  Future<List<RemoteDepatureModel>> getRouteDepartureTimes(
      int routeId, int direction) async {
    final results = await _eshotApi.getRouteDepartureTimes(routeId, direction);
    return results.map((json) => RemoteDepatureModel.fromJson(json)).toList();
  }

  @override
  Future<List<RemoteRouteInfoModel>> getAllRouteInfo() async {
    final results = await _eshotApi.getAllRouteInfo();
    return results.map((json) => RemoteRouteInfoModel.fromJson(json)).toList();
  }

  @override
  Future<List<RemoteActiveBusModel>> getRouteIncomingBuses(
      int routeId, int direction) async {
    final results = await _eshotApi.getRouteIncomingBuses(routeId, direction);
    return results.map((json) => RemoteActiveBusModel.fromJson(json)).toList();
  }

  @override
  Future<List<RemoteMapBusModel>> getRouteBusLocations(
      int routeId, int direction) async {
    final results = await _eshotApi.getRouteBusLocations(routeId, direction);
    return results.map((json) => RemoteMapBusModel.fromJson(json)).toList();
  }

  @override
  Future<List<RemoteRoutePointModel>> getRoutePoints(
      int routeId, int direction) async {
    final results = await _eshotApi.getRoutePoints(routeId, direction);
    return results.map((json) => RemoteRoutePointModel.fromJson(json)).toList();
  }

  @override
  Future<List<RemoteSearchResultModel>> getSearchResults(
      String searchText) async {
    _eshotApi.cancelSearch();
    final results = await _eshotApi.getSearchResults(searchText);
    return results
        .map((json) => RemoteSearchResultModel.fromJson(json))
        .toList();
  }
}
