import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/repository/ride_preferences_repository.dart';
import '../../../model/ride/ride_pref.dart';

import '../../dto/ride_preference_dto.dart';

class LocalRidePreferencesRepository extends RidePreferencesRepository {
  static const String _preferencesKey = "ride_preferences";

  @override
  Future<List<RidePreference>> getPastPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final storedPreferences = sharedPreferences.getStringList(_preferencesKey) ?? [];

    return storedPreferences
        .map((preferenceJson) => RidePreferenceDto.fromJson(jsonDecode(preferenceJson)))
        .toList();
  }

  @override
  Future<void> addPreference(RidePreference preference) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final existingPreferences = await getPastPreferences();

    existingPreferences.add(preference);

    final updatedPreferences = existingPreferences
        .map((pref) => jsonEncode(RidePreferenceDto.toJson(pref)))
        .toList();

    await sharedPreferences.setStringList(_preferencesKey, updatedPreferences);
  }
}