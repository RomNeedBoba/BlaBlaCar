import 'package:flutter/material.dart';

import '../../model/ride_pref/ride_pref.dart';
import '../../service/ride_prefs_service.dart';
import '../../theme/theme.dart';
import '../../utils/animations_util.dart';
import 'widgets/ride_pref_form.dart';
import '../ride/ride_screen.dart';

import 'widgets/ride_pref_history_tile.dart';

const String blablaHomeImagePath = 'assets/images/blabla_home.png';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///
class RidePrefScreen extends StatefulWidget {
  const RidePrefScreen({super.key});

  @override
  State<RidePrefScreen> createState() => _RidePrefScreenState();
}

extension DateTimeExtension on DateTime {
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

class _RidePrefScreenState extends State<RidePrefScreen> {
  final _formKey = GlobalKey<FormState>();
  final _departureController = TextEditingController();
  final _destinationController = TextEditingController();
  final _dateController = TextEditingController();

  onRidePrefSelected(RidePref ridePref) {
    Navigator.of(context).push(AnimationsUtil.createBottomToTopRoute(
      RideScreen(
        rides: RidePrefService.getMatchingRides(ridePref),
        onRideSelected: (ride) {
          // Handle ride selection
          // For now, just print the selected ride
          print('Selected ride: $ride');
        },
      ),
    ));
  }

  @override
  void dispose() {
    _departureController.dispose();
    _destinationController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    List<RidePref> ridePrefsToday = RidePrefService.ridePrefsHistory
        .where((ridePref) => ridePref.departureDate.isSameDay(now))
        .toList();

    return Stack(
      children: [
        // 1 - Background  Image
        BlaBackground(),

        // 2 - Foreground content
        Column(
          children: [
            SizedBox(height: 16),
            Text(
              "Your pick of rides at low price",
              style: BlaTextStyles.heading.copyWith(color: Colors.white),
            ),
            SizedBox(height: 100),
            Container(
              margin: EdgeInsets.symmetric(horizontal: BlaSpacings.xxl),
              decoration: BoxDecoration(
                color: Colors.white, // White background
                borderRadius: BorderRadius.circular(16), // Rounded corners
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 2.1 Display the Form to input the ride preferences
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RidePrefForm(),
                  ),
                  // 2.2 Optionally display a list of past preferences
                  SizedBox(
                    height: 200, // Set a fixed height
                    child: ListView.builder(
                      shrinkWrap: true, // Fix ListView height issue
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: ridePrefsToday.length,
                      itemBuilder: (ctx, index) => RidePrefHistoryTile(
                        ridePref: ridePrefsToday[index],
                        onPressed: () =>
                            onRidePrefSelected(ridePrefsToday[index]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BlaBackground extends StatelessWidget {
  const BlaBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Image.asset(
        blablaHomeImagePath,
        fit: BoxFit.cover, // Adjust image fit to cover the container
      ),
    );
  }
}
