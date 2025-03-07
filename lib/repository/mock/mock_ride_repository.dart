import 'package:w4_blabla_project_part2/model/user/user.dart';

import '../../dummy_data/dummy_data.dart';
import '../../model/ride/ride.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../service/rides_service.dart';
import '../ride_repository.dart';

class MockRideRepository implements RidesRepository {
  final List<RidePreference> _ridePreferences = List.generate(5, (index) {
    return RidePreference(
      departure: fakeLocations[40], // Battambang
      arrival: fakeLocations[39], // Siem Reap
      departureDate: DateTime.now().add(Duration(
          hours: index.isEven ? 5 : 8, minutes: index == 0 ? 30 : 0)),
      requestedSeats: index == 1 ? 0 : (index % 2 == 0 ? 1 : 2),
    );
  });

  final List<RidesFilter> _ridesFilter = [
    RidesFilter(petsAccepted: false),
    RidesFilter(petsAccepted: false),
    RidesFilter(petsAccepted: false),
    RidesFilter(petsAccepted: true),
    RidesFilter(petsAccepted: false),
  ];

  @override
  List<Ride> getRides(
    RidePreference preference,
    RidesFilter? filter,
    RideSortType? sortType,
  ) {
 // Get filtered rides based on preference
    List<Ride> rides = ridesService.getRidesFor(preference);

    // Apply sorting if sort type is provided
    if (sortType != null) {
      switch (sortType) {
        case RideSortType.departure:
          rides.sort(
            (a, b) =>
                a.departureLocation.name.compareTo(b.departureLocation.name),
          );
          break;
        case RideSortType.departureDate:
          rides.sort((a, b) => a.departureDate.compareTo(b.departureDate));
          break;
        case RideSortType.arrival:
          rides.sort(
            (a, b) => a.arrivalLocation.name.compareTo(b.arrivalLocation.name),
          );
          break;
        case RideSortType.requestedSeats:
          rides.sort((a, b) => b.availableSeats.compareTo(a.availableSeats));
          break;
      }
    }

    return rides;
  }
}
