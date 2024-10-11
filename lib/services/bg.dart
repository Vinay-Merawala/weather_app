import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WeatherAppBG extends ChangeNotifier{

  late double latitude;
  late double longitude;

  late double currentTemp;
  late int currentWeatherCode;

  late List weatherCodes;
  late List maxTemps;
  late List minTemps;

  late String dayOfWeek;
  late int dayOfMonth;
  late String month;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> fetchPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      Position currentPosition = await Geolocator.getCurrentPosition();
      latitude = currentPosition.latitude;
      longitude = currentPosition.longitude;

      notifyListeners();

    }
    catch (e) {
      print("Caught Exception : $e" );
    }


  }

  Future<void> getWeather() async {

    try{
      // get time info
      Response response = await get(Uri.parse('https://api.open-meteo.com/v1/forecast?latitude=22.5626&longitude=88.363&current=temperature_2m,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto')); // get and Response object in http module
      Map data = jsonDecode(response.body); // jsonDecode in convert , for converting json string to map

      currentTemp = data["current"]["temperature_2m"];
      currentWeatherCode = data["current"]["weather_code"];

      maxTemps = data["daily"]["temperature_2m_max"].sublist(0,5);
      minTemps = data["daily"]["temperature_2m_min"].sublist(0,5);
      weatherCodes = data["daily"]["weather_code"].sublist(0,5);

      _isLoading = false;
      notifyListeners();

    }catch(e){
      print("caught error: $e");
    }
  }

  void getTime(){
    DateTime now = DateTime.now();
    dayOfWeek = DateFormat('EEEE').format(now);
    dayOfMonth = now.day;
    month = DateFormat.MMMM().format(now);

    notifyListeners();
  }

  Future<void> initializeWeatherApp() async {
    _isLoading = true;
    notifyListeners(); // Notify listeners that loading has started

    await fetchPosition();
    getTime();
    await getWeather();

    _isLoading = false;
    notifyListeners(); // Notify listeners that the loading has completed
  }
}
