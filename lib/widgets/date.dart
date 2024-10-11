import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Styles/weather_app_style.dart';
import 'package:weather_app/services/bg.dart';

class Date extends StatefulWidget {
  final double width;
  final double height;

  const Date({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {


  @override
  Widget build(BuildContext context) {
    if (widget.width > 800) {
      return Consumer<WeatherAppBG>(
        builder: (context, weatherAppModel, child) =>
            Container(
              width: widget.width / 3,
              height: widget.height / 7,
              decoration: WeatherAppStyle.dateTitleTile,
              child: Center(
                child: Text(
                  " ${weatherAppModel.dayOfWeek} , ${weatherAppModel
                      .dayOfMonth} ${weatherAppModel.month}",
                  style: WeatherAppStyle.dateLarge,
                ),
              ),
            ),
      );
    }

    else {
      return Consumer<WeatherAppBG>(
          builder: (context, weatherAppModel, child) =>
              Container(
                height: widget.height / 15,
                width: widget.width - (widget.width * 0.2),
                decoration: WeatherAppStyle.dateTitleTile,
                child: Center(
                  child: Text(
                    "${weatherAppModel.dayOfWeek} , ${weatherAppModel
                        .dayOfMonth} ${weatherAppModel.month}",
                    style: WeatherAppStyle.dateLarge,
                  ),
                ),
              )
      );
    }
  }
}

