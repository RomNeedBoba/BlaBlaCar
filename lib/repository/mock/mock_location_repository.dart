import 'package:w4_blabla_project_part2/dummy_data/dummy_data.dart';

import '../../model/ride/locations.dart';
import '../locations_repository.dart';

class MockLocationsRepository implements LocationsRepository {
  // Filter to include only Cambodian locations
  final List<Location> _fakeLocation = fakeLocations
      .where((location) => location.country == Country.cambodia)
      .toList();

  @override
  List<Location> getLocations() {
    return _fakeLocation;
  }
}