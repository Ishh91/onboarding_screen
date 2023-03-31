import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'views/onboarding_page.dart';
import './views/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Walk_in Wellness',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ), // textTheme: GoogleFonts,
        primarySwatch: Colors.blue,
      ),
      home: OnBoardingPage(),
    );
  }
}
// this is dart file
