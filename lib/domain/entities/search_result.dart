enum SearchResultType { stop, bus }

class SearchResult {
  final int id;
  final SearchResultType type;
  final String name, workHours, stopBuses;
  final double lat, lng;

  SearchResult(
      {required this.id,
      required this.type,
      required this.name,
      required this.workHours,
      required this.stopBuses,
      required this.lat,
      required this.lng});
}
