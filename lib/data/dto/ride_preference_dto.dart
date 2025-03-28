  import '../../model/ride/ride_pref.dart';
  import 'location_dto.dart';

  class RidePreferenceDto {
    static Map<String, dynamic> toJson(RidePreference ridePreference) {
      return {
        'departure': LocationDto.toJson(ridePreference.departure),
        'arrival': LocationDto.toJson(ridePreference.arrival),
        'departureDate': ridePreference.departureDate.toIso8601String(),
        'requestedSeats': ridePreference.requestedSeats,
      };
    }

    static RidePreference fromJson(Map<String, dynamic> data) {
      return RidePreference(
        departure: LocationDto.fromJson(data['departure']),
        arrival: LocationDto.fromJson(data['arrival']),
        departureDate: DateTime.parse(data['departureDate']),
        requestedSeats: data['requestedSeats'],
      );
    }
  }