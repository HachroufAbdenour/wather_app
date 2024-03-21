import 'package:flutter/material.dart';


class WeatherInfoWidget extends StatelessWidget {
  final String iconPath;
  final String temperature;
  final String infoTitle;

  const WeatherInfoWidget({
    required this.iconPath,
    required this.temperature,
    required this.infoTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image(image: AssetImage(iconPath), height: 40,),
          Text(temperature, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          Text(infoTitle, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
    );
  }
}
