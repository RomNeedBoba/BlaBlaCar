///
/// Enumation of available BlaBlaCar countries
///
enum Country {
  france('France'),
  uk('United Kingdom'),
  spain('Spain');

  final String name;

  const Country(this.name);
}

///
/// This model describes a location (city, street).
///
class Location {
  final String name;
  final Country country;

  const Location({required this.name, required this.country});

  // Copy constructor
  Location.copy(Location other)
      : name = other.name,
        country = other.country;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Location && other.name == name && other.country == country;
  }

  @override
  int get hashCode => name.hashCode ^ country.hashCode;

  @override
  String toString() {
    return name;
  }
}

///
/// This model describes a street.
///
class Street {
  final String name;
  final Location city;

  const Street({required this.name, required this.city});
}
