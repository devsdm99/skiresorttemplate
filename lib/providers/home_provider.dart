import 'package:flutter/material.dart';
import 'package:skiresorttemplate/models/models.dart';

class HomeProvider with ChangeNotifier {
  static TimeStatisticsModel statistics = TimeStatisticsModel(
      weather: "Sunny",
      averageTemp: -1,
      maxTemp: 5,
      minTemp: -2,
      percentagePrep: 10,
      windSpeed: 12);

  final Map<String, IconData> icons = {
    "Cloudy": Icons.cloud_outlined,
    "Sunny": Icons.wb_sunny_outlined,
    "Snow": Icons.snowing
  };
}
