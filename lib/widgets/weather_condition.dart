import 'package:flutter/material.dart';
import 'package:weather_app/Styles/weather_app_style.dart';

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
  static const weather = "Sunny 🌞";

  @override
  Widget build(BuildContext context) {
    if(widget.width > 800){
      return Container(
        padding: const EdgeInsets.all(20),
        child: Text(
          weather,
          style: WeatherAppStyle.weatherCondn,
        ),
      );
    }
    else{
      return SizedBox(
        height: widget.height/10,
        child: Center(
          child: Text(
            weather,
            style: WeatherAppStyle.weatherCondn,
          ),
        ),
      );
    }
  }
}
