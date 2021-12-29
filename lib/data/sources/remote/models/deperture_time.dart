import 'package:eshot_clone/data/sources/local/models/departure_time.dart';

class RemoteDepatureModel {
  final int routeId;
  final String clock;
  final int order;
  final bool accessible, bike, electric;

  RemoteDepatureModel(
      {required this.routeId,
      required this.clock,
      required this.order,
      required this.accessible,
      required this.bike,
      required this.electric});
  factory RemoteDepatureModel.fromJson(Map<String, dynamic> json) {
    return RemoteDepatureModel(
        routeId: json["TarifeId"],
        clock: json["Saat"],
        order: json["Sira"],
        accessible: json["EngelliMi"],
        bike: json["BisikletliMi"],
        electric: json["ElektrikliMi"]);
  }

  DepartureTimeHiveModel toHiveModel() {
    return DepartureTimeHiveModel(
        routeId, clock, order, accessible, bike, electric);
  }
}
