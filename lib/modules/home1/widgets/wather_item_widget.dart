import 'package:flutter/material.dart';

class WeatherItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color:  Color(0xFF331C71),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "10 AM",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image(
                  image: AssetImage("assets/icons/cloudy.png"),
                  height: 40,
                ),
                Text(
                  "23°",
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
