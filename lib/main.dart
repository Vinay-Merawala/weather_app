import 'dart:core';
import 'package:flutter/material.dart';
import 'package:weather_app/widgets/geolocator.dart';
import 'package:weather_app/widgets/weather_app.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primaryColor: Colors.yellow,
      ),
      home: const LocationWidget(),
    );
  }
}


