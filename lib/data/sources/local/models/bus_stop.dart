import 'package:hive_flutter/hive_flutter.dart';

import 'package:eshot_clone/domain/entities/bus_stop.dart';

part 'bus_stop.g.dart';

@HiveType(typeId: 4)
class BusStopHiveModel extends HiveObject {
  static const String boxKey = 'bus_stop';

  @HiveField(0)
  int stopId;

  @HiveField(1)
  String name;

  @HiveField(2)
  double x;

  @HiveField(3)
  double y;

  @HiveField(4)
  String stopBuses;

  BusStopHiveModel(
      this.stopId, this.name, this.x, this.y, this.stopBuses);

  BusStop toEntity() {
    return BusStop(
        stopId: stopId, name: name, x: x, y: y, stopBuses: stopBuses);
  }
}
