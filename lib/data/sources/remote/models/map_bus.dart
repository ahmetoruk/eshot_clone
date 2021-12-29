import 'package:eshot_clone/domain/entities/map_bus.dart';

class RemoteMapBusModel {
  final int busId, firstStopId, lastStopId;
  final String x, y;
  final bool bike, accessible;
  RemoteMapBusModel({
    required this.busId,
    required this.firstStopId,
    required this.lastStopId,
    required this.x,
    required this.y,
    required this.bike,
    required this.accessible,
  });

  factory RemoteMapBusModel.fromJson(Map<String, dynamic> json) {
    return RemoteMapBusModel(
        busId: json["OtobusId"],
        firstStopId: json["IlkDurakId"],
        lastStopId: json["SonDurakId"],
        x: json["KoorX"],
        y: json["KoorY"],
        bike: json["BisikletAparatiVarMi"],
        accessible: json["EngelliMi"]);
  }
  MapBus toEntity() {
    return MapBus(
        busId: busId,
        firstStopId: firstStopId,
        lastStopId: lastStopId,
        x: double.parse(x),
        y: double.parse(y),
        bike: bike,
        engelliMi: accessible);
  }
}
