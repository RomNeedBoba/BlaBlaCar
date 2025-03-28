import 'package:flutter/material.dart';
import '../../model/ride/ride_pref.dart';
import '../../data/repository/ride_preferences_repository.dart';
import 'async_value.dart';

class RidesPreferencesProvider extends ChangeNotifier {
  RidePreference? _currentPreference;
  List<RidePreference> _pastPreferences = [];
  final RidePreferencesRepository repository;

  late AsyncValue<List<RidePreference>> pastPreferences;

  RidesPreferencesProvider({required this.repository}) {
    // Initialize pastPreferences with a loading state
    pastPreferences = AsyncValue.loading();
    // Fetch past preferences asynchronously
    fetchPastPreferences();
  }

  RidePreference? get currentPreference => _currentPreference;

  Future<void> fetchPastPreferences() async {
    // 1- Handle loading
    pastPreferences = AsyncValue.loading();
    notifyListeners();
    try {
      // 2 Fetch data
      List<RidePreference> pastPrefs = await repository.getPastPreferences();
      // 3 Handle success
      pastPreferences = AsyncValue.success(pastPrefs);
      // 4 Handle error
    } catch (error) {
      pastPreferences = AsyncValue.error(error);
    }
    notifyListeners();
  }

  void setCurrentPreferrence(RidePreference pref) {
    // 1- We process only if the new preference is not equal to the current one
    if (_currentPreference != pref) {
      // 2- We first update the current preference
      _currentPreference = pref;
      print('Set current pref : $_currentPreference');

      // 3- We then update the history All preferences in history shall be exclusive (different) !
      repository.addPreference(pref);
      print('Add pref to history : $_currentPreference');

      // 4- We finally notify the listeners
      notifyListeners();
    }
  }


  // History is returned from newest to oldest preference
  List<RidePreference> get preferencesHistory =>
      _pastPreferences.reversed.toList();
}
