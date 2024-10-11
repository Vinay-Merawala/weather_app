import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Styles/weather_app_style.dart';

import '../services/bg.dart';

class WeatherCondition extends StatefulWidget {
  final double width;
  final double height;

  const WeatherCondition({
    super.key,
    required this.width,
    required this.height
  });


  @override
  State<WeatherCondition> createState() => _WeatherConditionState();
}

class _WeatherConditionState extends State<WeatherCondition> {

  String getWeatherDescription(int wmoCode) =>
          (wmoCode >= 0 && wmoCode <= 3) ? "Clear sky"
          : (wmoCode == 45 || wmoCode == 48) ? "Foggy"
          : (wmoCode >= 50 && wmoCode <= 57) ? "Drizzle"
          : (wmoCode >= 60 && wmoCode <= 67) ? "Rain"
          : (wmoCode >= 70 && wmoCode <= 82) ? "Rain showers"
          : (wmoCode == 95 || wmoCode == 96 || wmoCode == 99) ? "Thunderstorm"
          : "Unknown weather condition";

  @override
  Widget build(BuildContext context) {
    if(widget.width > 800){
      return Consumer<WeatherAppBG>(
          builder: (context, weatherAppModel, child) =>

          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              getWeatherDescription(weatherAppModel.weatherCodes[0]),
              style: WeatherAppStyle.weatherCondn,
            ),
          )
      );
    }
    else{
      return
        Consumer<WeatherAppBG>(
          builder: (context, weatherAppModel, child) =>

          SizedBox(
            height: widget.height/10,
            child: Center(
              child: Text(
                getWeatherDescription(weatherAppModel.weatherCodes[0]),
                style: WeatherAppStyle.weatherCondn,
              ),
            ),
          )
        );
    }
  }
}
