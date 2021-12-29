import 'package:eshot_clone/domain/entities/active_bus.dart';

class RemoteActiveBusModel {
  final int busId, routeId, stopsLeft;
  final double x, y;

  RemoteActiveBusModel(
      {required this.busId,
      required this.routeId,
      required this.stopsLeft,
      required this.x,
      required this.y});
  factory RemoteActiveBusModel.fromJson(Map<String, dynamic> json) {
    return RemoteActiveBusModel(
        busId: json["OtobusId"] as int,
        routeId: json["HatNumarasi"] as int,
        stopsLeft: json["KalanDurakSayisi"] as int,
        x: double.parse(json["KoorX"]),
        y: double.parse(json["KoorY"]));
  }
  ActiveBus toEntity() {
    return ActiveBus(
        busId: busId,
        routeId: routeId,
        stopsLeft: stopsLeft,
        x: x,
        y: y);
  }
}
