import 'package:flutter/material.dart';

import '../../../../model/ride/ride_pref.dart';
import '../../../theme/theme.dart';
import '../../../../utils/date_time_util.dart';
import '../../../widgets/actions/bla_text_button.dart';

///
///  A top bar combining the ride preference summary  + the navigation back button
///  A Filter button appears on the right to filter the view
///
class RidePrefBar extends StatelessWidget {
  const RidePrefBar({
    super.key,
    required this.ridePreference,
    required this.onBackPressed,
    required this.onPreferencePressed,
    required this.onFilterPressed,
  });

  final RidePreference ridePreference;

  final VoidCallback onBackPressed;
  final VoidCallback onPreferencePressed;
  final VoidCallback onFilterPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: BlaColors.backgroundAccent,
        borderRadius:
            BorderRadius.circular(BlaSpacings.radius), // Rounded corners
      ),
      child: Row(
        children: [
          // 1 - Left icon
          IconButton(
            onPressed: onBackPressed,
            icon: Icon(
              Icons.arrow_back_ios,
              color: BlaColors.iconLight,
              size: 16,
            ),
          ),

          // 2 - Ride Summary
          Expanded(
            child: RidePrefSummary(
              ridePref: ridePreference,
              onPressed: onPreferencePressed,
            ),
          ),

          // 3 - Filter button
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: BlaTextButton(text: "Filter", onPressed: onFilterPressed),
          )
        ],
      ),
    );
  }
}

class RidePrefSummary extends StatelessWidget {
  final RidePreference ridePref;
  final VoidCallback onPressed;
  const RidePrefSummary(
      {super.key, required this.ridePref, required this.onPressed});

  String get title => "${ridePref.departure.name} → ${ridePref.arrival.name}";

  String get subTitle =>
      "${DateTimeUtils.formatDateTime(ridePref.departureDate)}, ${ridePref.requestedSeats} passenger${ridePref.requestedSeats > 1 ? "s" : ""}";

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    BlaTextStyles.label.copyWith(color: BlaColors.textNormal)),
            Text(subTitle,
                style: BlaTextStyles.label.copyWith(color: BlaColors.textLight))
          ],
        ),
      ),
    );
  }
}
