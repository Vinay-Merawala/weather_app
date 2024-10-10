import 'package:flutter/material.dart';
import 'package:weather_app/Styles/weather_app_style.dart';

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

  static const curTemp = "31°";

  @override
  Widget build(BuildContext context) {
    if(widget.width > 800) {
      return Container(
        height: widget.height/ 2 * 0.80,
        child: Center(
          child: Text(
            curTemp,
            style: WeatherAppStyle.tempLarge,
          ),
        ),
      );
    }else{
      return Container(
        height: widget.height/3 * 0.75,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 25),
        child: Center(
          child: Text(
            curTemp,
            style: WeatherAppStyle.tempSmall,
          ),
        ),
      );
    }
  }
}

