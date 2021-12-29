class DepartureTime {
  final int id, order;
  final String clock;
  final bool accessible, bike, electric;

  DepartureTime(
      {required this.id,
      required this.order,
      required this.clock,
      required this.accessible,
      required this.bike,
      required this.electric});
}
