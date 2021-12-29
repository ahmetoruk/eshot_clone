import 'package:hive_flutter/hive_flutter.dart';

import 'package:eshot_clone/data/sources/local/models/bus_stop.dart';
import 'package:eshot_clone/domain/entities/route.dart';

part 'route.g.dart';

@HiveType(typeId: 3)
class RouteHiveModel extends HiveObject {
  static const String boxKey = 'route';

  @HiveField(0)
  int routeId;

  @HiveField(1)
  int direction;

  @HiveField(2)
  List<BusStopHiveModel> stops;

  RouteHiveModel(this.routeId, this.direction, this.stops);

  Route toEntity() {
    return Route(
        routeStart: "",
        routeEnd: "",
        stops: stops.map((e) => e.toEntity()).toList());
  }
}
