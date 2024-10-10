import 'package:flutter/material.dart';
import 'package:weather_app/Styles/WeatherAppStyle.dart';

class HorizontalListBuilder extends StatelessWidget {
  final double width;
  final double height;

  final List<String> list1 = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  final List<String> list2 = ['Data 1', 'Data 2', 'Data 3', 'Data 4'];
  final List<String> list3 = ['Info 1', 'Info 2', 'Info 3', 'Info 4'];

  final Color horListColor = Colors.pink;

  HorizontalListBuilder({
    super.key,
    required this.width,
    required this.height
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 150, // Specify the height of the horizontal list
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
                  itemCount: list1.length, // Since all lists have the same length
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100, // Adjust item width
                      margin: const EdgeInsets.only(right: 15.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: WeatherAppStyle.horTile,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            list1[index], // First list item
                            style: const TextStyle(color: Colors.black, fontSize: 18,
                            fontFamily: ""),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            list2[index], // Second list item
                            style: const TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            list3[index], // Third list item
                            style: const TextStyle(color: Colors.black, fontSize: 14),
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
      );
  }
}