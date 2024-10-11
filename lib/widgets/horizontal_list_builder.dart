import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Styles/weather_app_style.dart';

import '../services/bg.dart';

class HorizontalListBuilder extends StatefulWidget {
  final double width;
  final double height;


  const HorizontalListBuilder({
    super.key,
    required this.width,
    required this.height
  });

  @override
  State<HorizontalListBuilder> createState() => _HorizontalListBuilderState();
}

class _HorizontalListBuilderState extends State<HorizontalListBuilder> {


  @override
  Widget build(BuildContext context) {
    if(widget.width > 800){
      return
        Consumer<WeatherAppBG>(
          builder: (context, weatherAppModel, child) =>

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: widget.height/2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Weekly Forecast",
                    style: WeatherAppStyle.horListTitle,
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: weatherAppModel.maxTemps.length - 1,
                      itemBuilder: (context, index) {
                        return Container(
                          width: widget.width/4 * 0.95, // Adjust item width
                          margin: EdgeInsets.only(right: widget.width/4 * 0.05),
                          padding: const EdgeInsets.all(16.0),
                          decoration: WeatherAppStyle.horTile,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //TODO: ADD TEXT STYLES TO STYLE FILE
                              Text(
                                "${weatherAppModel.maxTemps[index + 1]}", // First list item
                                style: const TextStyle(color: Colors.black, fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${weatherAppModel.minTemps[index + 1]}", // Second list item
                                style: const TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                getWeatherDescription(weatherAppModel.weatherCodes[index + 1]), // Third list item
                                style: const TextStyle(color: Colors.black, fontSize: 20 ,fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        );
    }
    else{
      return
        Consumer<WeatherAppBG>(
          builder: (context, weatherAppModel, child) =>

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: widget.height/4 * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Weekly Forecast",
                    style: WeatherAppStyle.horListTitle,
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: weatherAppModel.maxTemps.length - 1,
                      itemBuilder: (context, index) {
                        return Container(
                          width: widget.width/3 * 0.95, // Adjust item width
                          margin: EdgeInsets.only(right: widget.width/3 * 0.05),
                          decoration: WeatherAppStyle.horTile,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${weatherAppModel.maxTemps[index + 1]}", // First list item
                                style: const TextStyle(color: Colors.black, fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${weatherAppModel.minTemps[index + 1]}", // Second list item
                                style: const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                getWeatherDescription(weatherAppModel.weatherCodes[index + 1]), // Third list item
                                style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        );
    }
  }
}

String getWeatherDescription(int wmoCode) =>
    (wmoCode >= 0 && wmoCode <= 3) ? "Clear sky"
        : (wmoCode == 45 || wmoCode == 48) ? "Foggy"
        : (wmoCode >= 50 && wmoCode <= 57) ? "Drizzle"
        : (wmoCode >= 60 && wmoCode <= 67) ? "Rain"
        : (wmoCode >= 70 && wmoCode <= 82) ? "Rain showers"
        : (wmoCode == 95 || wmoCode == 96 || wmoCode == 99) ? "Thunderstorm"
        : "Unknown weather condition";
