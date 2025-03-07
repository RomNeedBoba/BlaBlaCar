import '../model/ride/ride.dart';
import '../model/ride_pref/ride_pref.dart';
import '../service/rides_service.dart';

abstract class RidesRepository {
  List<Ride> getRides(RidePreference preference, RidesFilter? filter);
}