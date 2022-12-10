import 'package:flutter/material.dart';
import 'package:skiresorttemplate/models/models.dart';

class HomeProvider with ChangeNotifier {
  final List<TimeStatisticsModel> statistics = [
    TimeStatisticsModel(
        sector: "Sector 1",
        weather: "Cloudy",
        averageTemp: -3,
        maxTemp: 6,
        minTemp: -4,
        percentagePrep: 0,
        windSpeed: 2),
    TimeStatisticsModel(
        sector: "Sector 2",
        weather: "Sunny",
        averageTemp: -1,
        maxTemp: 5,
        minTemp: -2,
        percentagePrep: 10,
        windSpeed: 12),
      TimeStatisticsModel(
        sector: "Sector 3",
        weather: "Snow",
        averageTemp: -10,
        maxTemp: -1,
        minTemp: -15,
        percentagePrep: 70,
        windSpeed: 80),
  ];

  final Map<String, IconData> icons = {
    "Cloudy": Icons.cloud_outlined,
    "Sunny": Icons.wb_sunny_outlined,
    "Snow": Icons.snowing
  };
}
