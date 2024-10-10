import 'package:flutter/material.dart';
import 'package:weather_app/Styles/weather_app_style.dart';

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

  static const  day = "Friday";
  static const month = "January";
  static const date = "20";


  @override
  Widget build(BuildContext context) {
    if(widget.width > 600) {
      return Container(
        width: widget.width/3,
        height: 50,
        decoration: WeatherAppStyle.dateTitleTile,
        child: Center(
          child: Text(
            " $day , $date $month",
            style: WeatherAppStyle.dateLarge,
          ),
        ),
      );
    }else{
      return Container(
        height: 50,
        width: widget.width - 100,
        decoration: WeatherAppStyle.dateTitleTile,
        child: Center(
          child: Text(
            " $day , $date $month",
            style: WeatherAppStyle.dateLarge,
          ),
        ),
      );
    }
  }
}
