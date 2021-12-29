import 'package:eshot_clone/domain/entities/route_point.dart';

class RemoteRoutePointModel {
  final String lat, lng;
  RemoteRoutePointModel({required this.lat, required this.lng});
  factory RemoteRoutePointModel.fromJson(Map<String, dynamic> json) {
    return RemoteRoutePointModel(lat: json["Lng"], lng: json["Lat"]);
  }
  RoutePoint toEntity() {
    return RoutePoint(lat: double.parse(lat), lng: double.parse(lng));
  }
}
