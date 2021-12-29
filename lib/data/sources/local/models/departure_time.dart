import 'package:hive_flutter/hive_flutter.dart';

import 'package:eshot_clone/domain/entities/departure_time.dart';

part 'departure_time.g.dart';

@HiveType(typeId: 2)
class DepartureTimeHiveModel extends HiveObject {
  static const String boxKey = 'departure_time';

  @HiveField(0)
  int id;

  @HiveField(1)
  String clock;

  @HiveField(2)
  int order;

  @HiveField(3)
  bool accessible;

  @HiveField(4)
  bool bike;

  @HiveField(5)
  bool electric;

  DepartureTimeHiveModel(this.id, this.clock, this.order, this.accessible,
      this.bike, this.electric);

  DepartureTime toEntity() {
    return DepartureTime(
        id: id,
        order: order,
        clock: clock,
        accessible: accessible,
        bike: bike,
        electric: electric);
  }
}
