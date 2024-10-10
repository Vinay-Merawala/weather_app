import 'package:flutter/material.dart';

class WeatherAppStyle{

  static Color themeColor = Colors.pink;
  static Color tempColor = Colors.black;
  static Color title = Colors.black;
  static Color conTextColor = Colors.pink;
  static Color conColor = Colors.black;
  static Color horListConColor = Colors.pink;


  // Location Title Styles
  static TextStyle locTitleLarge = TextStyle(
    color: WeatherAppStyle.title,
    fontFamily: "SF-Compact",
    fontSize: 75,
  );

  static TextStyle locTitleSmall = TextStyle(
    color: WeatherAppStyle.title,
    fontFamily: "SF-Compact",
    fontSize: 50,
  );

  // Date Tile Styles
  static TextStyle dateLarge =  TextStyle(
    fontFamily: "Ledger",
    fontSize: 25,
    color: conTextColor,
  );

  static BoxDecoration dateTitleTile = BoxDecoration(
    color: WeatherAppStyle.conColor,
    borderRadius: const BorderRadius.all(Radius.circular(30)), // Rounded corners
  );

  //Weather Condition Styles
  static TextStyle weatherCondn = TextStyle(
    color: WeatherAppStyle.title,
    height: 1.2,
    fontFamily: "SF-Compact",
    fontSize: 20,
  );

  //Temp Style
  static TextStyle temp = TextStyle(
    color: WeatherAppStyle.tempColor,
    fontFamily: "SF-Compact",
    fontSize: 150,
  );

  //Max Min Styles
  static TextStyle maxMinTitle = TextStyle(
    height: 1.5,
    fontFamily: "Ledger",
    fontSize: 23,
    color: WeatherAppStyle.conTextColor,
  );

  static TextStyle maxMinTemp = TextStyle(
    color: WeatherAppStyle.tempColor,
    fontFamily: "SF-Compact",
    fontSize: 50,
  );

  // Horizontal Tile Styles
  static TextStyle horListTitle =  TextStyle(
    color: WeatherAppStyle.title,
    fontFamily: "SF-Compact",
    fontSize: 20,
  );

  static BoxDecoration horTile = BoxDecoration(
    color: WeatherAppStyle.horListConColor,
    border: Border.all(width: 3, color: Colors.black),
    borderRadius: BorderRadius.circular(10.0),
  );







}