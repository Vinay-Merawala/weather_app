import 'package:flutter/material.dart';
import 'package:weather_app/Styles/weather_app_style.dart';

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
  late List<String> list1 = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  late List<String> list2 = ['Data 1', 'Data 2', 'Data 3', 'Data 4'];

  late List<String> list3 = ['Info 1', 'Info 2', 'Info 3', 'Info 4'];

  final Color horListColor = Colors.pink;

  @override
  Widget build(BuildContext context) {
    if(widget.width > 800){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: widget.height/2, // Specify the height of the horizontal list
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
                      width: widget.width/4 * 0.95, // Adjust item width
                      margin: EdgeInsets.only(right: widget.width/4 * 0.05),
                      padding: const EdgeInsets.all(16.0),
                      decoration: WeatherAppStyle.horTile,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //TODO: ADD TEXT STYLES TO STYLE FILE
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
    else{
      return Padding(
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
                  itemCount: list1.length, // Since all lists have the same length
                  itemBuilder: (context, index) {
                    return Container(
                      width: widget.width/3 * 0.95, // Adjust item width
                      margin: EdgeInsets.only(right: widget.width/3 * 0.05),
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
}