import 'package:firebase_database/firebase_database.dart';
import 'package:week_3_blabla_project/data/dto/location_dto.dart';
import 'package:week_3_blabla_project/data/repository/locations_repository.dart';

import '../../model/location/locations.dart';


class LocationFirebaseRepository extends LocationsRepository {
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref();

  @override
  Future<List<Location>> getLocations() async {
    try {
      // Fetch data from the "locations" node in Firebase
      final snapshot = await _databaseRef.child('locations').get();

      if (snapshot.exists) {
        // Convert the snapshot data to a list of Location objects
        final locationsMap = Map<String, dynamic>.from(snapshot.value as Map);
        return locationsMap.values
            .map((locationJson) =>
                LocationDto.fromJson(Map<String, dynamic>.from(locationJson)))
            .toList();
      } else {
        // Return an empty list if no data exists
        return [];
      }
    } catch (e) {
      // Handle errors (e.g., network issues)
      throw Exception('Failed to fetch locations: $e');
    }
  }
}