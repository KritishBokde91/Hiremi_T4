import 'package:flutter/material.dart';
import 'package:hiremi_t4/screens/basic_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF5F5F5)
      ),
      debugShowCheckedModeBanner: false,
      home: BasicDetailsScreen(),
    );
  }
}
