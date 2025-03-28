import '../../model/location/locations.dart';

class LocationDto {
  static Map<String, dynamic> toJson(Location location) {
    return {
      'name': location.name,
      'country': location.country.name,
    };
  }

  static Location fromJson(Map<String, dynamic> json) {
    final country = _parseCountry(json['country']);
    return Location(
      name: json['name'],
      country: country,
    );
  }

  static Country _parseCountry(String countryName) {
    return Country.values.firstWhere(
      (country) => country.name == countryName,
      orElse: () => throw ArgumentError('Invalid country: $countryName'),
    );
  }
}