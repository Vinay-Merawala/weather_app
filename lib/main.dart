import 'dart:core';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/services/bg.dart';

import 'package:weather_app/pages/loading.dart';
import 'package:weather_app/pages/weather_app.dart';
import 'package:weather_app/services/weather_app_initializer.dart';


Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context) => WeatherAppBG()),
        ChangeNotifierProvider(create: (context) => WeatherAppInitializer(Provider.of<WeatherAppBG>(context,listen: false))),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
         initialRoute: "/",
         routes: {
           '/': (context) => const Loading(),
           '/home': (context) => const WeatherApp(),
         }
      ),
    );
  }
}


