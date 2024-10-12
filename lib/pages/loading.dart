import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../services/weather_app_initializer.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  setUpWeatherApp() async {
    final weatherAppInitializer = Provider.of<WeatherAppInitializer>(
        context, listen: false);
    await weatherAppInitializer.initializeWeatherApp();
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }


  @override
  void initState() {
    super.initState();
    setUpWeatherApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: SpinKitRotatingCircle(
        color: Colors.white,
        size: 80.0,
      ),
    );
  }
}
