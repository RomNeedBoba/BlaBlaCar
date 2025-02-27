import 'package:flutter/material.dart';
import 'screens/ride_pref/ride_pref_screen.dart';
// import 'screens/exercise/ride_pref_form_screen.dart'; // ex4
import 'theme/theme.dart';
// import 'package:BLABLACAR/screens/exercise/bla_but.dart'; ex3
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});


@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(body: RidePrefScreen()),
      // home: const BlaButtonTestScreen(), // Set the home to BlaButtonTestScreen ex3
      // home: const RidePrefFormTestScreen(), // Set the home to RidePrefFormTestScreen ex4
    );
  }
}