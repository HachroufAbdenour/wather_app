import 'package:flutter/material.dart';

class WeatherForecastItem extends StatelessWidget {
  final String day;
  final String weatherIconPath;
  final String wind;
  final String highTemperature;
  final String lowTemperature;

  const WeatherForecastItem({
    required this.day,
    required this.weatherIconPath,
    required this.wind,
    required this.highTemperature,
    required this.lowTemperature,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              day,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            ),
          ),
          Expanded(
            flex: 2,
            child: Image(image: AssetImage(weatherIconPath), height: 40),
          ),
          Expanded(
            flex: 2,
            child: Text(
              wind,
              style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w300),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              highTemperature,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              lowTemperature,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
