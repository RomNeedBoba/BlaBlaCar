import 'package:flutter/material.dart';
import '../../model/ride/locations.dart';
import '../ride_pref/widgets/ride_pref_form.dart';
import '../../../model/ride_pref/ride_pref.dart';

class RidePrefFormTestScreen extends StatelessWidget {
  const RidePrefFormTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RidePrefForm Test Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RidePrefForm(
          initRidePref: RidePref(
            departure: Location(name: 'Paris', country: Country.france),
            departureDate: DateTime.now(),
            arrival: Location(name: 'Remnes', country: Country.france),
            requestedSeats: 2,
          ),
        ),
      ),
    );
  }
}