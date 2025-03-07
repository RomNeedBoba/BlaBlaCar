import '../model/ride_pref/ride_pref.dart';

abstract class RidePreferencesRepository {

  List<RidePreference> getPastPreferences();

  void addPreference(RidePreference preference);
}
