import 'package:flutter/material.dart';
// import 'screens/ride_pref/ride_pref_screen.dart';
import 'theme/theme.dart';
import 'package:BLABLACAR/screens/exercise/bla_but.dart';
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
      // home: Scaffold(body: RidePrefScreen()),
      home: const BlaButtonTestScreen(), // Set the home to BlaButtonTestScreen
    );
  }
}