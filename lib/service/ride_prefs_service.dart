import '../../../screens/ride_pref/ride_pref_screen.dart';
import '../model/ride/ride.dart';
import '../model/ride_pref/ride_pref.dart';
import '../dummy_data/dummy_data.dart';


/// This service handles:
/// - History of the last ride preferences (to allow users to re-use their last preferences)
/// - Current selected ride preferences.
class RidePrefService {
  /// List of past entered ride preferences. LIFO (most recent first)
  static List<RidePref> ridePrefsHistory = fakeRidePrefs; // TODO: Replace with real data

  static RidePref? currentRidePref;

  static bool get hasCurrentRidePref => currentRidePref != null;

  static List<Ride> getMatchingRides(RidePref ridePref) {
    return fakeRides.where((ride) =>
        ride.departureLocation == ridePref.departure &&
        ride.arrivalLocation == ridePref.arrival &&
        ride.departureDate.isSameDay(ridePref.departureDate)).toList();
  }
}
