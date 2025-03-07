import 'package:flutter/material.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../theme/theme.dart';
import '../../../utils/date_time_util.dart';

///
/// This tile represents an item in the list of past entered ride inputs
///
class RidePrefHistoryTile extends StatelessWidget {
  final RidePreference ridePref;
  final VoidCallback? onPressed;

  const RidePrefHistoryTile({super.key, required this.ridePref, this.onPressed});

  String get title => "${ridePref.departure.name} → ${ridePref.arrival.name}";

  String get subTitle =>
      "${DateTimeUtils.formatDateTime(ridePref.departureDate)},  ${ridePref.requestedSeats} passenger${ridePref.requestedSeats > 1 ? "s" : ""}";

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Text(title, style: BlaTextStyles.body.copyWith(color: BlaColors.textNormal)),
      subtitle: Text(subTitle, style: BlaTextStyles.label.copyWith(color: BlaColors.textLight)),
      leading: Icon(Icons.history, color: BlaColors.iconLight,),
      trailing: Icon(Icons.arrow_forward_ios, color: BlaColors.iconLight, size: 16,),
    );
  }
}
