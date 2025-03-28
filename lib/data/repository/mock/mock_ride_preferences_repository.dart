import '../../../model/ride/ride_pref.dart';
import '../ride_preferences_repository.dart';

import '../../dummy_data/dummy_data.dart';

class MockRidePreferencesRepository extends RidePreferencesRepository {
  final List<RidePreference> _pastPreferences = fakeRidePrefs;

  @override
  Future<List<RidePreference>> getPastPreferences() async {
    await Future.delayed(const Duration(seconds: 2));
    return _pastPreferences;
  }

  @override
  Future<void> addPreference(RidePreference preference) async {
    await Future.delayed(const Duration(seconds: 2));
    _pastPreferences.add(preference);
  }
}
