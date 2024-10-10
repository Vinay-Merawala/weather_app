import 'package:flutter/material.dart';
import 'package:weather_app/Styles/weather_app_style.dart';

class Location extends StatefulWidget {

  final double width;
  final double height;

  const Location({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  static const location = "Trichy";
  @override
  Widget build(BuildContext context) {
    if(widget.width > 800) {
      return SizedBox(
        height: widget.height / 3,
        child: Center(
          child: Text(
            location,
            style: WeatherAppStyle.locTitleLarge,
          ),
        ),
      );
    }else{
      return Container(
        padding: const EdgeInsets.only(top: 5, left: 15, right: 15, bottom:15),
        child: Center(
          child: Text(
            location,
            style: WeatherAppStyle.locTitleSmall,
          ),
        ),
      );
    }
  }
}


