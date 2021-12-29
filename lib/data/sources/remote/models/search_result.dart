import 'package:eshot_clone/domain/entities/search_result.dart';

class RemoteSearchResultModel {
  final int id, type;
  final String name, workHours, stopBuses, lat, long;

  RemoteSearchResultModel(
      {required this.id,
      required this.type,
      required this.name,
      required this.workHours,
      required this.stopBuses,
      required this.lat,
      required this.long});
  factory RemoteSearchResultModel.fromJson(Map<String, dynamic> json) {
    return RemoteSearchResultModel(
        id: json["Id"],
        type: json["Tip"],
        name: json["Adi"],
        workHours: json["CalismaSaatleri"] ?? "",
        stopBuses: json["stopBuses"] ?? "",
        lat: json["Enlem"] ?? "",
        long: json["Boylam"] ?? "");
  }
  SearchResult toEntity() {
    return SearchResult(
        id: id,
        type: type == 1 ? SearchResultType.bus : SearchResultType.stop,
        name: name,
        workHours: workHours,
        stopBuses: stopBuses,
        lat: lat.isEmpty ? 0.0 : double.parse(lat),
        lng: lat.isEmpty ? 0.0 : double.parse(long));
  }
}
