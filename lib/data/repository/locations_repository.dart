import '../../model/location/locations.dart';

abstract class LocationsRepository {
  Future<List<Location>> getLocations();
}
