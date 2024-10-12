import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Styles/weather_app_style.dart';

import '../services/bg.dart';

class CurTemp extends StatefulWidget {
  final double width;
  final double height;

  const CurTemp({
    super.key,
    required this.width,
    required this.height,

  });

  @override
  State<CurTemp> createState() => _CurTempState();
}

class _CurTempState extends State<CurTemp> {

  @override
  Widget build(BuildContext context) {
    if(widget.width > 800) {
      return
        Consumer<WeatherAppBG>(
          builder: (context, weatherAppModel, child) =>

          Container(
            height: widget.height/ 2 * 0.80,
            child: Center(
               child: Text(
                  "${(weatherAppModel.currentTemp).toInt()}°",
                  style: WeatherAppStyle.tempLarge,
              ),
            ),
          )
        );
    }
    else{
      return Consumer<WeatherAppBG>(
          builder: (context, weatherAppModel, child) =>

          Container(
            height: widget.height/3 * 0.75,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(bottom: 25),
            child: Center(
              child: Text(
                "${(weatherAppModel.currentTemp).toInt()}°",
                style: WeatherAppStyle.tempSmall,
              ),
            ),
          )
        );
    }
  }
}

