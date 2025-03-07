import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class BlaDivider extends StatelessWidget {
  const BlaDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: BlaColors.greyLight,
    );
  }
}
