import '../model/ride/locations.dart';

abstract class LocationsRepository {
  List<Location> getLocations();
}
