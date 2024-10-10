import 'package:flutter/material.dart';
import 'package:weather_app/Styles/WeatherAppStyle.dart';

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
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 40),
      child: Center(
        child: Text(
          curTemp,
          style: WeatherAppStyle.temp,
        ),
      ),
    );
  }
}
