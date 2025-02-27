import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../dummy_data/dummy_data.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../model/ride/locations.dart';
import '../../../widgets/actions/bla_button.dart';
//
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;
// final ex4
  final uniqueFakeLocations = fakeLocations.toSet().toList();

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO ex4
     if (widget.initRidePref != null) {
      departure = widget.initRidePref!.departure;
      departureDate = widget.initRidePref!.departureDate;
      arrival = widget.initRidePref!.arrival;
      requestedSeats = widget.initRidePref!.requestedSeats;
    } else {
      departureDate = DateTime.now();
      requestedSeats = 1;
    }
  }

  // ----------------------------------
  // Handle events ex4
  // ----------------------------------
bool isFormValid() {
    return departure != null && arrival != null && requestedSeats > 0;
  }


  // ----------------------------------
  // Compute the widgets rendering ex4
  // ----------------------------------

 void switchLocations() {
    setState(() {
      final temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: departureDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != departureDate) {
      setState(() {
        departureDate = picked;
      });
    }
  }
  
  // ----------------------------------
  // Build the widgets ex4
  // ----------------------------------
 @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('EEE d MMM');
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: DropdownButton<Location>(
                hint: Text('Select Departure'),
                value: uniqueFakeLocations.contains(departure) ? departure : null,
                items: uniqueFakeLocations.map((location) {
                  return DropdownMenuItem<Location>(
                    value: location,
                    child: Text(location.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    departure = value;
                  });
                },
                icon: null, // Remove the dropdown icon
              ),
            ),
            IconButton(
              icon: Icon(Icons.swap_vert),
              onPressed: switchLocations,
            ),
          ],
        ),
        DropdownButton<Location>(
          hint: Text('Select Arrival'),
          value: uniqueFakeLocations.contains(arrival) ? arrival : null,
          items: uniqueFakeLocations.map((location) {
            return DropdownMenuItem<Location>(
              value: location,
              child: Text(location.name),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              arrival = value;
            });
          },
          icon: null, // Remove the dropdown icon
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.calendar_today_rounded),
              onPressed: () => selectDate(context),
            ),
            Text(
              dateFormat.format(departureDate),
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Requested Seats',
            icon: Icon(Icons.person),
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            setState(() {
              requestedSeats = int.tryParse(value) ?? 1;
            });
          },
        ),
        BlaButton(
          text: 'Search',
          onPressed: isFormValid()
              ? () {
                  final ridePref = RidePref(
                    departure: departure!,
                    departureDate: departureDate,
                    arrival: arrival!,
                    requestedSeats: requestedSeats,
                  );
                  // Add the ridePref to the history
                  fakeRidePrefs.add(ridePref);
                }
              : () {},
        ),
      ],
    );
  }
}