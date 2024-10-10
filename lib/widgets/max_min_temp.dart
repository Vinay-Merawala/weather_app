import 'package:flutter/material.dart';
import 'package:weather_app/Styles/weather_app_style.dart';

class MaxMinTemp extends StatefulWidget {
  final double width;
  final double height;

  const MaxMinTemp({
    super.key,
    required this.width,
    required this.height
  });

  @override
  State<MaxMinTemp> createState() => _MaxMinTempState();
}

class _MaxMinTempState extends State<MaxMinTemp> {

  static const min = "24°";
  static const max = "32°";

  final Color textColor = Colors.pink;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                width: 150,
                margin: const EdgeInsets.only(top: 20, right: 5),
                decoration: WeatherAppStyle.dateTitleTile,
                child: Center(
                  child: Text(
                    "Max temp",
                    style: WeatherAppStyle.maxMinTitle,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: Center(
                  child: Text(
                    max,
                    style: WeatherAppStyle.maxMinTemp,
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Container(
                width: 150,
                margin: const EdgeInsets.only(top: 20, right: 5),
                decoration: WeatherAppStyle.dateTitleTile,
                child: Center(
                  child: Text(
                    "Min temp",
                    style: WeatherAppStyle.maxMinTitle,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: Center(
                  child: Text(
                    min,
                    style: WeatherAppStyle.maxMinTemp,
                  ),
                ),
              )
            ],
          ),
        ]
    );
  }
}
