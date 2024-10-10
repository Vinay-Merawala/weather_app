import 'package:flutter/material.dart';
import 'package:weather_app/Styles/WeatherAppStyle.dart';

class WeatherCondition extends StatefulWidget {
  final double width;
  final double height;

  const WeatherCondition({
    super.key,
    required this.width,
    required this.height
  });


  @override
  _WeatherConditionState createState() => _WeatherConditionState();
}

class _WeatherConditionState extends State<WeatherCondition> {
  static const weather = "Sunny 🌞";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Text(
        weather,
        style: WeatherAppStyle.weatherCondn,
      ),
    );
  }
}
