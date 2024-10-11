import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../services/bg.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final weatherProvider = Provider.of<WeatherAppBG>(context, listen: false);
      weatherProvider.initializeWeatherApp().then((_) {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      });
    });
  }

  void setupWeatherApp() async {
    WeatherAppBG loc = WeatherAppBG();
    await loc.fetchPosition();
    loc.getTime();
    await loc.getWeather();
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Center(
        child: Consumer<WeatherAppBG>(
          builder: (context, weatherProvider, child) {
            if (weatherProvider.isLoading) {
              // Show loading spinner while the data is being fetched
              return const SpinKitRotatingCircle(
                color: Colors.white,
                size: 80.0,
              );
            } else {
              return const Text("Data Loaded! Redirecting...");
            }
          },
        ),
      ),
    );
  }
}