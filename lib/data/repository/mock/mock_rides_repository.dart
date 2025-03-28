import '../../../model/ride/ride.dart';
import '../../../model/ride/ride_filter.dart';
import '../../../model/ride/ride_pref.dart';
import '../rides_repository.dart';

import '../../../model/location/locations.dart';
import '../../../model/user/user.dart';

class MockRidesRepository extends RidesRepository {
  final List<Ride> _allRides = [];

  MockRidesRepository() {
    // FAKE USERS
    User kanika = User(firstName: "Kannika");
    User chaylim = User(firstName: "Chaylim");

    // FAKE LOCATIONS
    Location battambang = Location(
      name: "Battambang",
      country: Country.cambodia,
    );
    Location siemReap = Location(name: "Siem Reap", country: Country.cambodia);

    // FAKE RIDES

    Ride ride1 = Ride(
      departureLocation: battambang,
      departureDate: DateTime.now().copyWith(hour: 17, minute: 30),
      arrivalLocation: siemReap,
      arrivalDateTime: DateTime.now().copyWith(hour: 19, minute: 30),
      driver: kanika,
      availableSeats: 2,
      pricePerSeat: 10,
    );

    Ride ride2 = Ride(
      departureLocation: battambang,
      departureDate: DateTime.now().copyWith(hour: 20, minute: 00),
      arrivalLocation: siemReap,
      arrivalDateTime: DateTime.now().copyWith(hour: 22, minute: 00),
      driver: chaylim,
      availableSeats: 0,
      pricePerSeat: 10,
    );

    _allRides.addAll([ride1, ride2]);
  }

  @override
  List<Ride> getRidesFor(RidePreference prefs, RideFilter? filter) {
    return _allRides
        .where(
          (ride) =>
              // Filter on departure / arrival
              ride.departureLocation == prefs.departure &&
              ride.arrivalLocation == prefs.arrival &&
              // Filter on pets if required
              (filter != null && filter.onlyPets ? ride.acceptPets : true) &&
              // Filter on rides with available seat only
              ride.availableSeats > 0,
        )
        .toList();
  }
}
