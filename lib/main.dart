import 'package:flutter/material.dart';
import 'package:kasper_tech_task/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Primary Color for the app
    const MaterialColor kPrimaryColor = MaterialColor(0xFFFFB61D, <int, Color>{
      50: Color(0xFFFFB61D),
      100: Color(0xFFFFB61D),
      200: Color(0xFFFFB61D),
      300: Color(0xFFFFB61D),
      400: Color(0xFFFFB61D),
      500: Color(0xFFFFB61D),
      600: Color(0xFFFFB61D),
      700: Color(0xFFFFB61D),
      800: Color(0xFFFFB61D),
      900: Color(0xFFFFB61D),
    });
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
