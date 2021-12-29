class RouteInfo {
  final int routeId, routeNum, himRouteId;
  final String name,
      description,
      routeStart,
      routeEnd,
      workHoursStart,
      workHoursEnd,
      searchName,
      fare;
  RouteInfo(
      {required this.routeId,
      required this.routeNum,
      required this.himRouteId,
      required this.name,
      required this.description,
      required this.routeStart,
      required this.routeEnd,
      required this.workHoursStart,
      required this.workHoursEnd,
      required this.searchName,
      required this.fare});
}
