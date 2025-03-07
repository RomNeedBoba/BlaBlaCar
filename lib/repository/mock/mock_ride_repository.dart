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
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return RidesService().getRidesFor(preference);
  }
}
