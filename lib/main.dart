import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/input_screen.dart';
import 'screens/result_screen.dart';

void main() {
  runApp(MyApp());
}

/// The root widget of the NIC Decoder application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NIC Decoder',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Color(0xFF121212),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: InputScreen(),
      getPages: [
        GetPage(
          name: '/',
          page: () => InputScreen(),
          transition: Transition.fadeIn, // Smooth fade animation
        ),
        GetPage(
          name: '/result',
          page: () => ResultScreen(),
          transition: Transition.rightToLeftWithFade, // Premium swipe animation
        ),
      ],
    );
  }
}
