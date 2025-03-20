import 'model/ride/locations.dart';
import 'model/ride_pref/ride_pref.dart';

abstract class Ridepreferenceslistener {
  void onPreferencesSelection(RidePreference selectedPreference);
}

class RidepreferencesService {
  late RidePreference _ridePref;
  final List<Ridepreferenceslistener> _listeners = [];

  void addListener(Ridepreferenceslistener listener) {
    _listeners.add(listener);
  }

  void setRidePreference(RidePreference newRidePref) {
    _ridePref = newRidePref;
    _notifyListeners();
  }

  void _notifyListeners() {
    for (var listener in _listeners) {
      listener.onPreferencesSelection(_ridePref);
    }
  }
}

class ConsoleLogger implements Ridepreferenceslistener {
  @override
  void onPreferencesSelection(RidePreference selectedPreference) {
    print('ConsoleLogger: Selected preference: ${selectedPreference}');
  }
}

void main() {
  RidepreferencesService ridepreferencesService = RidepreferencesService();
  ConsoleLogger consoleLogger = ConsoleLogger();

  RidePreference selectedPreference = RidePreference(
    departure: Location(name: "Phnom penh", country: Country.cambodia),
    arrival: Location(name: "Phnom penh", country: Country.cambodia),
    departureDate: DateTime.now(),
    requestedSeats: 2,
  );

  ridepreferencesService.addListener(consoleLogger);
  ridepreferencesService.setRidePreference(selectedPreference);
}
