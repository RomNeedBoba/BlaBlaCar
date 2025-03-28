import '../location/locations.dart';

///
/// This model describes a ride preference.
/// A ride preference consists of the selection of a departure + arrival + a date and a number of passenger
///
class RidePreference {
  final Location departure;
  final DateTime departureDate;
  final Location arrival;
  final int requestedSeats;

  const RidePreference(
      {required this.departure,
      required this.departureDate,
      required this.arrival,
      required this.requestedSeats});

  // Implement the operator == and hash Code methods
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RidePreference &&
        other.departure == departure &&
        other.departureDate == departureDate &&
        other.arrival == arrival &&
        other.requestedSeats == requestedSeats;
  }

  @override
  int get hashCode =>
      departure.hashCode ^
      departureDate.hashCode ^
      arrival.hashCode ^
      requestedSeats.hashCode;

  @override
  String toString() {
    return 'RidePref(departure: ${departure.name}, '
        'departureDate: ${departureDate.toIso8601String()}, '
        'arrival: ${arrival.name}, '
        'requestedSeats: $requestedSeats)';
  }
}
