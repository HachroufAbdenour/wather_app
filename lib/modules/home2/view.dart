import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/icon_button_widget.dart';
import 'widgets/wather_forecast_item.dart';
import 'widgets/wather_info_widget.dart';

class HomeScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF331C71),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCustomAppBar(),
              
              SizedBox(height: 12),

              Container(
                height: 320,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff5842A9),
                ),
                child: _buildWeatherForecast(),
              ),

              SizedBox(height: 10),

              Expanded(
                child: _buildWeatherForecastList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }





Widget _buildCustomAppBar() {
  return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButtonWidget(
                    iconPath: "assets/icons/back.png",
                    onPressed: () {
Get.back();                      // Add functionality for menu bar button
                    },
                    bColor:  Color(0xff5842A9),
                  ),
                  Text(
                    "7days",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  IconButtonWidget(
                    iconPath: "assets/icons/vertical-dots.png",
                    onPressed: () {
                      // Add functionality for vertical dots button
                    },
                                      bColor:  Color(0xff5842A9),

                  ),
                  
                ],
  );
}




             





Widget _buildWeatherForecast(){
return const Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image(
                      image: AssetImage("assets/icons/cloudy.png"),
                      height: 140),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Tomorrow",
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 12),
                      Text("Mostly Cloudy",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 125, left: 100),
              child: Text("19",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 140, left: 100),
              child: Text("    /15°",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.normal)),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WeatherInfoWidget(
              iconPath: "assets/icons/weather.png",
              temperature: "30°",
              infoTitle: "Precipitation",
            ),
            WeatherInfoWidget(
              iconPath: "assets/icons/humidity.png",
              temperature: "20'",
              infoTitle: "Humidity",
            ),
            WeatherInfoWidget(
              iconPath: "assets/icons/wind.png",
              temperature: "9Km/h",
              infoTitle: "Wind Speed",
            ),
            
          ],
        ),
      ],
    );
}


Widget _buildWeatherForecastList() {
  return ListView(
    children: const [
      WeatherForecastItem(
        day: "Monday",
        weatherIconPath: "assets/icons/cloudy.png",
        wind: "Light Breeze",
        highTemperature: "+24°",
        lowTemperature: "+16°",
      ),
      WeatherForecastItem(
        day: "Tuesday",
        weatherIconPath: "assets/icons/cloudy.png",
        wind: "Gentle Breeze",
        highTemperature: "+22°",
        lowTemperature: "+15°",
      ),
      WeatherForecastItem(
        day: "Wednesday",
        weatherIconPath: "assets/icons/cloudy.png",
        wind: "Moderate Wind",
        highTemperature: "+20°",
        lowTemperature: "+14°",
      ),
      WeatherForecastItem(
        day: "Thursday",
        weatherIconPath: "assets/icons/cloudy.png",
        wind: "Strong Wind",
        highTemperature: "+18°",
        lowTemperature: "+12°",
      ),
      WeatherForecastItem(
        day: "Friday",
        weatherIconPath: "assets/icons/cloudy.png",
        wind: "Light Breeze",
        highTemperature: "+23°",
        lowTemperature: "+15°",
      ),
      WeatherForecastItem(
        day: "Saturday",
        weatherIconPath: "assets/icons/cloudy.png",
        wind: "Gentle Breeze",
        highTemperature: "+21°",
        lowTemperature: "+14°",
      ),
      WeatherForecastItem(
        day: "Sunday",
        weatherIconPath: "assets/icons/cloudy.png",
        wind: "Light Breeze",
        highTemperature: "+20°",
        lowTemperature: "+13°",
      ),
    ],
  );
}


  


}