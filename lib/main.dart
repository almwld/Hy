import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'presentation/screens/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'صحتك',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.cairo().fontFamily,
        useMaterial3: true,
        primarySwatch: Colors.teal,
      ),
      home: const OnboardingScreen(),
    );
  }
}
