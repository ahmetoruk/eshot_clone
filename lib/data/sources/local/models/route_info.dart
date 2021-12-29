import 'package:hive/hive.dart';

import 'package:eshot_clone/domain/entities/route_info.dart';

part 'route_info.g.dart';

@HiveType(typeId: 0)
class RouteInfoHiveModel extends HiveObject {
  static const String boxKey = 'route_info';

  @HiveField(0)
  int routeId;

  @HiveField(1)
  int routeNum;

  @HiveField(2)
  int himRouteId;

  @HiveField(3)
  String name;

  @HiveField(4)
  String description;

  @HiveField(5)
  String routeStart;

  @HiveField(6)
  String routeEnd;

  @HiveField(7)
  String workHoursStart;

  @HiveField(8)
  String workHoursEnd;

  @HiveField(9)
  String searchName;

  @HiveField(10)
  String fare;

  RouteInfoHiveModel(
      this.routeId,
      this.routeNum,
      this.himRouteId,
      this.name,
      this.description,
      this.routeStart,
      this.routeEnd,
      this.workHoursStart,
      this.workHoursEnd,
      this.searchName,
      this.fare);

  RouteInfo toEntity() {
    return RouteInfo(
        routeId: routeId,
        routeNum: routeNum,
        himRouteId: himRouteId,
        name: name,
        description: description,
        routeStart: routeStart,
        routeEnd: routeEnd,
        workHoursStart: workHoursStart,
        workHoursEnd: workHoursEnd,
        searchName: searchName,
        fare: fare);
  }
}
