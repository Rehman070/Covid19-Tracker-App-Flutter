import 'package:covid19_tracker_app/Screens/Splash_Screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid19 Tracker',
      theme: ThemeData(
       
        primarySwatch: Colors.purple,
      ),
      home: const Splash_Screen(),
    );
  }
}
