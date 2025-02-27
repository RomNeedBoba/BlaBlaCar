import 'package:flutter/material.dart';
import 'package:BLABLACAR/theme/theme.dart';
import 'package:BLABLACAR/widgets/actions/bla_button.dart';


class BlaButtonTestScreen extends StatelessWidget {
  const BlaButtonTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BlaButton Test Screen')),
      body: Padding(
        padding: const EdgeInsets.all(BlaSpacings.m),
        child: Column(
          children: [
            BlaButton(
              text: 'Primary Button',
              onPressed: () => print('Primary Button Pressed'),
            ),
            SizedBox(height: BlaSpacings.m),
            BlaButton(
              text: 'Secondary Button',
              isPrimary: false,
              onPressed: () => print('Secondary Button Pressed'),
            ),
            SizedBox(height: BlaSpacings.m),
            BlaButton(
              text: 'Primary Button with Icon',
              icon: Icons.check,
              onPressed: () => print('Primary Button with Icon Pressed'),
            ),
            SizedBox(height: BlaSpacings.m),
            BlaButton(
              text: 'Secondary Button with Icon',
              isPrimary: false,
              icon: Icons.check,
              onPressed: () => print('Secondary Button with Icon Pressed'),
            ),
          ],
        ),
      ),
    );
  }
}