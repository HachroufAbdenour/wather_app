import 'package:flutter/material.dart';

class WeatherCityWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        height: 30,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color:  Color(0xFF331C71),
        ),
        child: Padding(
          padding: const EdgeInsets.all(.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Image(
                image: AssetImage("assets/icons/cloudy.png"),
                height: 40,
              ),
              Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,    
                children: [
Text(
                "New Zealand",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Snowy",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

                ],
              ),

              Text(
                "9°",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
             
             
            ],
          ),
        ),
      ),
    );
  }
}
