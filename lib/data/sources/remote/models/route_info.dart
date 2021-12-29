import 'package:eshot_clone/data/sources/local/models/route_info.dart';

class RemoteRouteInfoModel {
  final int routeId, routeNum, himRouteId;
  final String name,
      description,
      routeStart,
      routeEnd,
      workHoursStart,
      workHoursEnd,
      searchName,
      fare;
  RemoteRouteInfoModel(
      {required this.routeId,
      required this.routeNum,
      required this.himRouteId,
      required this.name,
      required this.description,
      required this.routeStart,
      required this.routeEnd,
      required this.workHoursStart,
      required this.workHoursEnd,
      required this.searchName,
      required this.fare});

  factory RemoteRouteInfoModel.fromJson(Map<String, dynamic> json) {
    return RemoteRouteInfoModel(
      routeId: json["HatId"] as int,
      routeNum: json["HatNo"] as int,
      himRouteId: json["HimHatId"] as int,
      name: json["Adi"] as String,
      description: json["GuzergahAciklama"] as String,
      routeStart: json["HatBaslangic"] as String,
      routeEnd: json["HatBitis"] as String,
      workHoursStart: json["CalismaSaatiGidis"] as String,
      workHoursEnd: json["CalismaSaatiDonus"] as String,
      searchName: json["AramaAdi"] as String,
      fare: json["Tarife"] as String,
    );
  }

  RouteInfoHiveModel toHiveModel() {
    return RouteInfoHiveModel(routeId, routeNum, himRouteId, name, description,
        routeStart, routeEnd, workHoursStart, workHoursEnd, searchName, fare);
  }
}
