import 'package:eshot_clone/data/sources/local/models/bus_stop.dart';

class RemoteBusStopModel {
  final int stopId;
  final String name, stopBuses;
  final double x, y;
  RemoteBusStopModel(
      {required this.stopId,
      required this.name,
      required this.stopBuses,
      required this.x,
      required this.y});

  factory RemoteBusStopModel.fromJson(Map<String, dynamic> json) {
    return RemoteBusStopModel(
        stopId: json["DurakId"],
        name: json["Adi"],
        stopBuses: json["GecenHatNumaralari"],
        x: json["KoorX"],
        y: json["KoorY"]);
  }

  BusStopHiveModel toHiveModel() {
    return BusStopHiveModel(stopId, name, x, y, stopBuses);
  }
}
