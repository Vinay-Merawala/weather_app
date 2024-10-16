import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:weather_app/widgets/temperature.dart';
import 'package:weather_app/widgets/weather_condition.dart';
import '../Styles/weather_app_style.dart';
import '../widgets/date.dart';
import '../widgets/horizontal_list_builder.dart';
import '../widgets/title.dart';
import '../widgets/max_min_temp.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {

  final Color color = WeatherAppStyle.themeColor;

  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              // Larger screen layout
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                AppTitle(width:  width, height: height),
                                Date(width:  width, height: height),
                                WeatherCondition(width:  width, height: height),
                              ]
                            ),
                          ),
                          SizedBox(height: height - (height * 0.15)),
                          Expanded(
                            child: Column(
                              children: [
                                CurTemp(width:  width, height: height),
                              ],
                            ),
                          )
                        ],
                      ),
                      MaxMinTemp(width:  width, height: height),
                      HorizontalListBuilder(width:  width, height: height),
                    ],
                  ),
                ),
              );
            } else {
              // Smaller Screen layout
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppTitle(width:  width, height: height),
                      Date(width:  width, height: height),
                      WeatherCondition(width:  width, height: height),
                      CurTemp(width:  width, height: height),
                      MaxMinTemp(width:  width, height: height),
                      HorizontalListBuilder(width:  width, height: height),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}