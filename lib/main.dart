
import 'package:booking/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Swift Book',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}



