import 'package:eshot_clone/data/sources/local/models/route.dart';
import 'package:eshot_clone/data/sources/remote/models/bus_stop.dart';

class RemoteRouteModel {
  final int routeId, direction;
  final String routeStart, routeEnd;
  final List<RemoteBusStopModel> stops;
  RemoteRouteModel(
      {required this.routeId,
      required this.direction,
      required this.routeStart,
      required this.routeEnd,
      required this.stops});
  factory RemoteRouteModel.fromJson(Map<String, dynamic> json) {
    List<RemoteBusStopModel> stops = json["Duraklar"]
        .map<RemoteBusStopModel>((e) => RemoteBusStopModel.fromJson(e))
        .toList();
    return RemoteRouteModel(
        routeId: json["hatId"],
        direction: json["yon"],
        routeStart: json["GuzergahBas"],
        routeEnd: json["GuzergahBit"],
        stops: stops);
  }

  RouteHiveModel toHiveModel() {
    return RouteHiveModel(
        routeId, direction, stops.map((e) => e.toHiveModel()).toList());
  }
}
