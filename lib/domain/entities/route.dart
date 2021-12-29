import 'package:eshot_clone/domain/entities/bus_stop.dart';

class Route {
  final String routeStart, routeEnd;
  final List<BusStop> stops;
  const Route(
      {required this.routeStart, required this.routeEnd, required this.stops});
}
