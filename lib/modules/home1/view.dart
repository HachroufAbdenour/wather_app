import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home2/view.dart';
import '../home2/widgets/icon_button_widget.dart';
import 'widgets/city_item_widget.dart';
import 'widgets/custom_header.dart';
import 'widgets/wather_info_widget.dart';
import 'widgets/wather_item_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5842A9),

      body: SafeArea(
        child: SingleChildScrollView(
          
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               _buildCustomAppBar(),
                
                SizedBox(height: 12),
          
              _buildWeatherForecast(),
                
                SizedBox(height: 10),
          
             _buildWeatherContainer(),
          
                SizedBox(height: 18),
              _buildCustomheader("Today","7-Day Forecasts",() {
                Get.to(()=>HomeScreen2());
              }),
            
            _buildWeatherItemsListView(),
                            SizedBox(height: 10),
           _buildCustomheader("Other Cities","+", (){}),

                            SizedBox(height: 10),
          _buildWeatherCitiesListView(),

            
          
              ],
            ),
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
        iconPath: "assets/icons/menu_bar.png",
        onPressed: () {

          // Add functionality for menu bar button
        },
        bColor: Color(0xFF331C71),
      ),
      Text(
        "Sydney",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      IconButtonWidget(
        iconPath: "assets/icons/restart.png",
        onPressed: () {
          // Add functionality for vertical dots button
        },
        bColor: Color(0xFF331C71),
      ),
    ],
  );
}





Widget _buildCustomheader(String a,String b,VoidCallback? onTap) {
  return  CustomRow(
  leftText: a,
  rightText: b,
  onTap: onTap,
);


}



Widget _buildWeatherItemsListView() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
          WeatherItemWidget(),
         
        ],
      ),
    ),
  );
}

 


 
Widget _buildWeatherCitiesListView() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          WeatherCityWidget(),
   WeatherCityWidget(),
   WeatherCityWidget(),
   WeatherCityWidget(),
   WeatherCityWidget(),

         
        ],
      ),
    ),
  );
}



Widget _buildWeatherForecast(){
return  const Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
        children: [
                              Text("Mostly Sunny",  style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),

          Stack(
            
            children: [
                
                Padding(
                  padding: EdgeInsets.only(top: 65,left: 50),
                  child: Image(
                     image: AssetImage("assets/icons/cloudy.png"),
                          height: 140),
                ),
                
  
                    SizedBox(width: 50),
    
         Text("23°",
  style: TextStyle(color: Colors.white,fontSize: 120,fontWeight: FontWeight.bold)),
            ]
                
                        ),
                    
Text("Saturday,10February|10:00Am",  style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)),
               
         
            ],
        
      ),
);
}





Widget _buildWeatherContainer() {
  return Container(
    height: 110,
    width: 400,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color(0xFF331C71),
    ),
    child: const Row(
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
  );
}

}

