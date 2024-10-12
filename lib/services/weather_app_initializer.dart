import 'package:flutter/material.dart';

import 'bg.dart';

class WeatherAppInitializer extends ChangeNotifier {
  final WeatherAppBG weatherAppBG;

  WeatherAppInitializer(this.weatherAppBG);

  Future<void> initializeWeatherApp() async {
    try {
      await weatherAppBG.fetchPosition();
      await weatherAppBG.getWeather();
      weatherAppBG.getTime();
    } catch (e) {
      // Handle error: log it or show a message
      print("Caught error: $e");
      // You might want to set an error state here
    } finally {
      weatherAppBG.isLoading = false; // Ensure loading is set to false at the end
      notifyListeners(); // Notify listeners that loading has completed
    }
  }
}
