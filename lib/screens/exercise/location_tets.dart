import 'package:flutter/material.dart';
import '../../dummy_data/dummy_data.dart';
import '../../widgets/navigation/location_picker.dart';

class LocationPickerTestScreen extends StatelessWidget {
  const LocationPickerTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Location Picker Test')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LocationPicker(
          locations: fakeLocations, // Ensure fakeLocations is defined in dummy_data.dart
          onLocationSelected: (location) {
            print('Selected location: $location');
          },
        ),
      ),
    );
  }
}