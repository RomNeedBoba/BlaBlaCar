import 'package:flutter/material.dart';
import '../../../widgets/actions/bla_icon_button.dart';

import '../../../../model/ride/ride_pref.dart';
import '../../../theme/theme.dart';
import '../../ride_pref/widgets/ride_pref_form.dart';

class RidePrefModal extends StatefulWidget {
  const RidePrefModal({super.key, required this.initialPreference});

  final RidePreference? initialPreference;

  @override
  State<RidePrefModal> createState() => _RidePrefModalState();
}

class _RidePrefModalState extends State<RidePrefModal> {
  void onBackSelected() {
    Navigator.of(context).pop();
  }

  void onSubmit(RidePreference newPreference) {
    Navigator.of(context).pop(newPreference);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back icon
            BlaIconButton(onPressed: onBackSelected, icon: Icons.close),
            SizedBox(height: BlaSpacings.m),

            // Title
            Text(
              "Edit your search",
              style: BlaTextStyles.title.copyWith(color: BlaColors.textNormal),
            ),

            // Form
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: RidePrefForm(
                  initialPreference: widget.initialPreference,
                  onSubmit: onSubmit,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
