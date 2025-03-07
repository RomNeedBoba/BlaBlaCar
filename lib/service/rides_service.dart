import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';

import '../dummy_data/dummy_data.dart';
import '../model/ride/ride.dart';


enum RideSortType {
  departure,    
  departureDate,
  arrival,        
  requestedSeats, 
}


////
///   This service handles:
///   - The list of available rides
///
class RidesService {


  ///
  ///  Return the relevant rides, given the passenger preferences
  ///
   static final RidesService _instance = RidesService._internal();
  
  // Private constructor
  RidesService._internal();
  
  // Factory constructor to return the singleton instance
  factory RidesService() {
    return _instance;
  }
  
  // Instance variables instead of static variables
  List<Ride> availableRides = fakeRides;  
  
    List<Ride> getRidesFor(RidePreference preferences) {
 
    // For now, just a test
    return availableRides.where( (ride) => ride.departureLocation == preferences.departure && ride.arrivalLocation == preferences.arrival).toList();
  }
 }

class RidesFilter {
  final bool petsAccepted;

  RidesFilter({required this.petsAccepted});
}