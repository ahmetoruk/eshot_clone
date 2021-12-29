import 'package:hive_flutter/hive_flutter.dart';

import 'package:eshot_clone/data/sources/local/models/departure_time.dart';

part 'departure.g.dart';

@HiveType(typeId: 1)
class DepartureHiveModel extends HiveObject {
  static const String boxKey = 'departure';

  @HiveField(0)
  int routeId;

  @HiveField(1)
  int direction;

  @HiveField(2)
  List<DepartureTimeHiveModel> departureTimes;

  DepartureHiveModel(this.routeId, this.direction, this.departureTimes);
}
